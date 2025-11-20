# Definitions - Field Values

## Fields

### Leaf Fields (Primitive Types)

- ***:class:*** (`String`)
  - Example: `@class ___*___;
`
  - From: Base_DefinitionsLanguage.xctemplate

- ***:comments** (`String`)
  - Example: `//___FILEHEADER___
`
  - From: Base_DefinitionsLanguage.xctemplate

- ***:implementation:methods:applicationDidBecomeActive:comments** (`String`)
  - Example: `// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.`
  - From: tvOS App Base.xctemplate

- ***:implementation:methods:applicationDidEnterBackground:comments** (`String`)
  - Example: `// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
`
  - From: tvOS App Base.xctemplate

- ***:implementation:methods:applicationDidFinishLaunching:comments** (`String`)
  - Example: `// Insert code here to initialize your application`
  - From: macOS App Base.xctemplate

- ***:implementation:methods:applicationWillEnterForeground:comments** (`String`)
  - Example: `// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.`
  - From: tvOS App Base.xctemplate

- ***:implementation:methods:applicationWillResignActive:comments** (`String`)
  - Example: `// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
`
  - From: tvOS App Base.xctemplate

- ***:implementation:methods:applicationWillTerminate:comments** (`String`)
  - Example: `// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.`
  - From: tvOS App Base.xctemplate

- ***:implementation:synthesize:*** (`String`)
  - Example: `@synthesize ___*___;`
  - From: Base_DefinitionsLanguage.xctemplate

- ***:imports:importFramework:*** (`String`)
  - Example: `#import <___*___/___*___.h>`
  - From: Base_DefinitionsLanguage.xctemplate

- ***:imports:importHeader:*** (`String`)
  - Example: `#import "___*___"`
  - From: Base_DefinitionsLanguage.xctemplate


### Complex Fields (Nested Types)

- **Definitions** (`Dictionary`)
  - Nested type required

- ***:extension** (`Dictionary`)
  - Nested type required

- ***:implementation** (`Dictionary`)
  - Nested type required

- ***:implementation:methods** (`Dictionary`)
  - Nested type required

- ***:implementation:methods:*** (`Dictionary`)
  - Nested type required

- ***:implementation:methods:init** (`Dictionary`)
  - Nested type required

- ***:implementation:properties** (`Dictionary`)
  - Nested type required

- ***:implementation:synthesize** (`Dictionary`)
  - Nested type required

- ***:imports** (`Dictionary`)
  - Nested type required

- ***:interface** (`Dictionary`)
  - Nested type required

