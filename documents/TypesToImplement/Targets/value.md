# Targets - Field Values

## Fields

### Leaf Fields (Primitive Types)

- **BuildToolArgsString** (`String`)
  - Example: `$(ACTION)`
  - From: External Build System.xctemplate

- **BuildToolPath** (`String`)
  - Example: `___VARIABLE_buildToolPath___`
  - From: External Build System.xctemplate

- **Concrete** (`Int`)
  - Example: `0`
  - From: Cross-Platform Base.xctemplate

- **Name** (`String`)
  - Example: `___PACKAGENAME___`
  - From: Aggregate.xctemplate

- **ProductType** (`String`)
  - Example: `com.apple.product-type.bundle.unit-test`
  - From: Unit Testing Bundle Base.xctemplate

- **TargetIdentifier** (`String`)
  - Example: `com.apple.dt.cocoaLegacyTarget`
  - From: External Build System.xctemplate

- **TargetIdentifierToBeTested** (`String`)
  - Example: `com.apple.dt.iosApplicationTarget`
  - From: iOS App UI Test Bundle.xctemplate

- **TargetType** (`String`)
  - Example: `Legacy`
  - From: External Build System.xctemplate


### Complex Fields (Nested Types)

- **Targets** (`Array`)
  - Nested type required

- **BuildPhases** (`Array`)
  - Nested type required

- **Configurations** (`Dictionary`)
  - Nested type required

- **Frameworks** (`Array`)
  - Nested type required

- **SharedSettings** (`Dictionary`)
  - Nested type required

