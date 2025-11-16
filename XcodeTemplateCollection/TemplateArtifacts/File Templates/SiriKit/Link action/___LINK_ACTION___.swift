//___FILEHEADER___

import Foundation
___IMPORTS___

___INTENT_AVAILABILITY___
struct ___LINK_ACTION___: ___INTENT_TYPE___, CustomIntentMigratedAppIntent___MORE_CONFORMANCES___ {
    static let intentClassName = "___INTENT_CLASS_NAME___"

    static var title: LocalizedStringResource = "___LINK_ACTION_TITLE___"
    static var description = IntentDescription("___LINK_ACTION_DESCRIPTION___")
___PARAMETERS___
    static var parameterSummary: some ParameterSummary {
___ACTION_CONFIGURATION___
    }
___PREDICTIONS___
    func perform() async throws -> some IntentResult ___RESULT_DECLARATION___{
        // TODO: Place your refactored intent handler code here.
        return .result(___RESULT_VALUE___)
    }
}
___CUSTOM_DIALOG___
___AUXILIARY_CONTENT___
