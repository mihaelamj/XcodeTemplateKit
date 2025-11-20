# TemplateGenerator Tests

## Status
Generator field tests have been scaffolded but are not yet implemented.

## Structure
```
TemplateGeneratorTests/
  FieldTests/           # Field-specific generator tests (TODO)
    AllowedTypesTests/
    ...
  (future general generator tests)
```

## TODO
The field tests in `FieldTests/` contain TODO comments and need:
1. Proper conversion from plist values to TemplateMetadata fields
2. Actual serialization testing
3. Round-trip verification (parse → generate → parse)

## Shared Fixtures
Generator tests share fixtures with parser tests from `Tests/Fixtures/`

## Future Work
When implementing generator tests, update `Package.swift` to include the 
`generatorFieldTestTargets` (currently commented out).
