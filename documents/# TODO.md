# TODO:

## 1. Never use conditional views - use null views instead

Instead of :

```swift
        } else {
            ContentUnavailableView {
                Label("No Selection", systemImage: "sidebar.left")
            } description: {
                Text("Select an item from the sidebar to view its details")
            }
        }
```

do:

Understanding view identity** 
View identity is core to SwiftUI workings, whenever you see `@State` variables the way they work underneath is by using global reference store keyed by the view identity, thus when you cause views to loose their identity their data will also get lost.

- A `no-op` modifier is a modifier that is doing nothing to the actual display, like adding `.clear` background.

In this lesson I show you how you should always prefer `no-op` modifiers over conditional branches

```swift
// Different Identities
if flag {
   ViewWithState()
       .background(Color.red)
       .animation(.easeInOut(duration: 2), value: flag)
} else {
   ViewWithState()
       .animation(.easeInOut(duration: 2), value: flag)
}
  
// Single identity
// .clear option becomes a no-op 
ViewWithState()
    .background(flag ? .red : .clear)
    .animation(.easeInOut(duration: 2), value: flag)
```


## 2. TBD