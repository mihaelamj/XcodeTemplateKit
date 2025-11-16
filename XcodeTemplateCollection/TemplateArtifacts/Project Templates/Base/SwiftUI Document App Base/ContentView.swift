//___FILEHEADER___

import SwiftUI

struct ContentView: View {
    @Binding var document: ___PACKAGENAME:identifier___Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(___PACKAGENAME:identifier___Document()))
}
