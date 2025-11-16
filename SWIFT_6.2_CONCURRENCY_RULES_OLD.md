# Swift 6.2 Structured Concurrency & Actor Rules

## Documentation Sources
- SE-0304: Structured Concurrency (Swift 5.5)
- SE-0306: Actors (Swift 5.5)
- SE-0317: async let bindings (Swift 5.5)
- SE-0414: Region-based Isolation (Swift 6.0)
- Swift 6.2 Release Notes (September 15, 2025)

---

## PART 1: TASKS & STRUCTURED CONCURRENCY

### Rule 1: Task Fundamentals
**Source:** SE-0304:127-136

- **Every asynchronous function runs as part of a task**
- A task runs **one function at a time** (no internal concurrency)
- When an async function calls another async function, it runs in the **same task**
- Tasks can be in three states: **suspended**, **running**, or **completed**

### Rule 2: Child Tasks Must Complete Before Parent Returns
**Source:** SE-0304:164-167

> "A function that creates a child task must wait for it to end before returning. This structure means that functions can locally reason about all the work currently being done for the current task."

- **Child tasks have bounded duration** - cannot outlast parent
- Must **implicitly or explicitly await** all child tasks before scope exits
- This enables **static reasoning** about task trees
- Cancellation propagates **downward only** (not upward)

### Rule 3: Task Groups
**Source:** SE-0304:210-249

- **withThrowingTaskGroup** creates a scope for child tasks
- All child tasks must **complete when scope exits**
- Child tasks are **implicitly cancelled** if scope exits with error
- Results can be collected **in completion order** (not submission order)
- Task groups uphold **structured concurrency guarantees**

```swift
try await withThrowingTaskGroup(of: Result.self) { group in
    group.addTask { /* work */ }
    // Must consume all results before exiting
    for try await result in group {
        // Process results
    }
    // Scope exit waits for all tasks
}
```

### Rule 4: Task Priority
**Source:** SE-0304:186-205

- Child tasks **automatically inherit parent priority**
- Detached tasks **do not inherit** priority (no parent)
- **Priority escalation** occurs when:
  - Higher-priority task waits for lower-priority task
  - Higher-priority task enqueued on same actor
- Executors **should honor priority over submission order**

### Rule 5: async let Implicit Cancellation & Awaiting
**Source:** SE-0317:304-330

> "As we return from the function without ever having awaited on the values, both of them will be **implicitly cancelled and awaited on** before returning"

- **CRITICAL:** Unused `async let` tasks are **implicitly awaited** at scope exit
- Function always takes **max(time(task1), time(task2), ...)** to complete
- Cannot "early return" without awaiting remaining tasks
- **Implicit cancellation happens, but task still waits to complete**

```swift
async let f = fast()  // 300ms
async let s = slow()  // 3s
return "done"
// implicitly: cancels f
// implicitly: cancels s
// implicitly: await f  ← BLOCKS HERE
// implicitly: await s  ← BLOCKS HERE
// Total time: 3 seconds (not instant!)
```

### Rule 6: async let vs Task Groups for Racing
**Source:** SE-0317:501-517

- **async let does NOT implement racing** (implicit await defeats it)
- For **true racing**, use **withThrowingTaskGroup** + `group.next()`
- Racing pattern:

```swift
try await withThrowingTaskGroup(of: Result.self) { group in
    group.addTask { /* option 1 */ }
    group.addTask { /* option 2 */ }

    guard let winner = try await group.next() else {
        throw Error()
    }

    group.cancelAll()  // Cancel loser
    return winner
}
```

---

## PART 2: ACTORS

### Rule 7: Actor Isolation
**Source:** SE-0306:84-109

- Actors protect mutable state through **actor isolation**
- Stored instance properties can **only be accessed on self**
- All instance members are **actor-isolated by default**
- Actor-isolated code can freely reference other **actor-isolated on same instance**
- **Non-isolated** code cannot synchronously access actor-isolated state

### Rule 8: Cross-Actor References
**Source:** SE-0306:111-117

Two ways to access actor-isolated state from outside:

1. **Immutable state** (let constants with value types) - synchronous OK
2. **Async function calls** - turned into messages in actor's mailbox

```swift
actor BankAccount {
    let accountNumber: Int     // ✓ Can access synchronously
    var balance: Double        // ✗ Must use async

    func deposit(amount: Double) async {
        balance += amount
    }
}

let account = BankAccount(...)
print(account.accountNumber)    // ✓ Synchronous OK
await account.deposit(100)      // ✓ Async required
```

### Rule 9: Actor Reentrancy
**Source:** SE-0306:18-23

- Actors are **reentrant by default**
- After an `await`, actor state may have changed
- Multiple tasks can be **suspended** in same actor
- Only **one task executes** at a time
- Must **not assume state unchanged** after suspension points

### Rule 10: Actor Executors
**Source:** SE-0304:174-185, SE-0306:115

- Each actor has a **serial executor**
- Executors run tasks **one-at-a-time**
- **NOT guaranteed FIFO** - honors **priority** over order
- Different from `DispatchQueue` (which is strictly FIFO)
- Actors use **lightweight queue** optimized for async/await

---

## PART 3: MAINACTOR & SWIFT 6.2 FEATURES

### Rule 11: @MainActor Isolation
**Source:** SE-0306 (global actors), Swift 6.2 Release

- `@MainActor` marks code to run on main thread
- Entire **class** can be `@MainActor` (all members isolated)
- **Individual methods** can be `@MainActor`
- WKWebView and UI types are **@MainActor-isolated**

```swift
@MainActor
class DocumentationCrawler {
    private var webView: WKWebView!  // MainActor-isolated

    func loadPage() async throws -> String {
        // Runs on MainActor
        webView.load(...)
    }
}
```

### Rule 12: Swift 6.2 - Default Isolation (NEW)
**Source:** Swift 6.2 Release:144-150

- **NEW:** `-default-isolation MainActor` compiler flag
- Code runs on **main thread by default** without annotations
- Ideal for **UI code, scripts, executables**
- Use **@concurrent** to opt into concurrent execution

### Rule 13: Swift 6.2 - Caller Context Execution (NEW)
**Source:** Swift 6.2 Release:147

- **NEW:** `async` functions run in **caller's execution context**
- Previously: `nonisolated async` always switched to global executor
- Now: Can write async methods without switching executors
- **Opt-in upcoming feature:** `nonisolated-nonsending-by-default`

### Rule 14: Swift 6.2 - @concurrent Attribute (NEW)
**Source:** Swift 6.2 Release:150

- **NEW:** `@concurrent` explicitly marks concurrent execution
- Use to **opt into** concurrent thread pool
- Makes **intention clear** in code
- Keeps main actor free for UI work

---

## PART 4: SENDABLE & REGION-BASED ISOLATION

### Rule 15: Sendable Protocol
**Source:** SE-0302, SE-0414

- **Sendable** types can be safely passed across isolation boundaries
- Value types (structs) are **implicitly Sendable** if all members are
- Classes must **explicitly conform** and be immutable or synchronized
- **Non-Sendable** values cannot cross isolation boundaries (strict mode)

### Rule 16: Region-Based Isolation (Swift 6.0)
**Source:** SE-0414:1-100

- **NEW in Swift 6.0:** Can transfer non-Sendable values if:
  - Value is **not used after transfer**
  - No other value can **reference it**
- Compiler uses **control flow analysis**
- Enables natural patterns without `@unchecked Sendable`

```swift
func openAccount(name: String) async {
    let client = Client(name: name)  // Non-Sendable
    await store.add(client)          // ✓ Transfer OK
    // client.log()                  // ✗ Error: already transferred
}
```

---

## PART 5: FORBIDDEN PATTERNS (OLD CONCURRENCY)

### Rule 17: NO DispatchQueue in Structured Concurrency
**Source:** SE-0304, SE-0306:115

**FORBIDDEN:**
```swift
DispatchQueue.main.async { }
DispatchQueue.global().async { }
DispatchQueue.main.asyncAfter(deadline: .now() + 5) { }
```

**USE INSTEAD:**
```swift
Task { @MainActor in }           // Main thread work
Task.detached { }                // Background work
try await Task.sleep(for: .seconds(5))  // Delays
```

### Rule 18: NO Manual Continuations for Built-in APIs
**Source:** SE-0300

**FORBIDDEN (when async API exists):**
```swift
withCheckedThrowingContinuation { continuation in
    webView.evaluateJavaScript(...) { result, error in
        continuation.resume(...)
    }
}
```

**USE INSTEAD:**
```swift
try await webView.evaluateJavaScript(..., in: nil, contentWorld: .page)
```

### Rule 19: NO NSOperationQueue, pthread, Thread
**Source:** Swift Concurrency Design

**FORBIDDEN:**
```swift
Thread.detachNewThread { }
NSOperationQueue.main.addOperation { }
pthread_create(...)
```

**USE INSTEAD:**
- Task-based concurrency
- Actors for synchronization
- Structured concurrency primitives

---

## PART 6: MODERN ASYNC APIS

### Rule 20: WKWebView Async APIs (macOS 12.0+)
**Source:** WebKit Documentation

```swift
// Modern async API
func evaluateJavaScript(
    _ javaScript: String,
    in frame: WKFrameInfo?,
    contentWorld: WKContentWorld
) async throws -> Any?

// Usage
let result = try await webView.evaluateJavaScript(
    "document.body.innerHTML",
    in: nil,
    contentWorld: .page
)
```

### Rule 21: FileHandle.bytes AsyncSequence (macOS 12.0+)
**Source:** Foundation Documentation

**FORBIDDEN:**
```swift
let data = fileHandle.availableData  // Blocks indefinitely!
```

**USE INSTEAD:**
```swift
for try await byte in fileHandle.bytes {
    // Non-blocking async iteration
}
```

### Rule 22: Task.sleep API (macOS 13.0+)
**Source:** SE-0374: Clock, Instant, Duration

```swift
// Modern API
try await Task.sleep(for: .seconds(5))
try await Task.sleep(until: .now + .seconds(5))

// Old API (still works)
try await Task.sleep(nanoseconds: 5_000_000_000)
```

---

## COMPLIANCE CHECKLIST

### ✅ REQUIRED for Swift 6.2 Compliance:

1. [ ] No `DispatchQueue` usage
2. [ ] No `NSOperationQueue` usage
3. [ ] No manual `Thread` creation
4. [ ] No `withCheckedContinuation` for APIs with async versions
5. [ ] Use `withThrowingTaskGroup` for task racing
6. [ ] All child tasks explicitly or implicitly awaited
7. [ ] Proper `@MainActor` annotations for UI code
8. [ ] Use modern async APIs (WKWebView, FileHandle.bytes, etc.)
9. [ ] Sendable conformance for cross-isolation types
10. [ ] No blocking operations in async contexts

### ⚠️ COMMON MISTAKES:

1. **Using `async let` for racing** - It doesn't work! (implicit await)
2. **Forgetting implicit await** - `async let` blocks on scope exit
3. **Using old callback APIs** - Check for async versions first
4. **Mixing DispatchQueue with Tasks** - Pick one paradigm
5. **Assuming FIFO order** - Actors honor priority, not order
6. **Mutating after await** - Actor state may have changed

---

## VERIFICATION COMMANDS

```bash
# Check for forbidden patterns
grep -r "DispatchQueue" Sources/
grep -r "NSOperationQueue" Sources/
grep -r "Thread.detach" Sources/
grep -r "withCheckedContinuation" Sources/
grep -r "withCheckedThrowingContinuation" Sources/

# Build with strict concurrency
swift build -Xswiftc -strict-concurrency=complete

# Check Swift version
swift --version  # Should be 6.2+
```

---

**Last Updated:** Based on Swift 6.2 Release (September 15, 2025)
**Project:** Cupertino Documentation Crawler
**Compliance Goal:** 100% Swift 6.2 Structured Concurrency
