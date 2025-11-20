# OptionsUnitsObjective-CDefinitionsmain - Field Values

## Fields

### Leaf Fields (Primitive Types)

- **m:main:NSApplicationMain** (`String`)
  - Example: `@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
}
return NSApplicationMain(argc, argv);`
  - From: macOS Safari Extension App.xctemplate

- **m:main:UIApplicationMain** (`String`)
  - Example: `NSString * appDelegateClassName;
@autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
    appDelegateClassName = NSStringFromClass([AppDelegate class]);
}
return UIApplicationMain(argc, argv, nil, appDelegateClassName);
`
  - From: tvOS App Base.xctemplate


### Complex Fields (Nested Types)

- **m:main** (`Dictionary`)
  - Nested type required

