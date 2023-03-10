//
//  NotesView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/9/23.
//

import SwiftUI

struct NotesView: View {
    @Binding var notes: String
    @FocusState.Binding var editorShouldFocus: Bool
    //@FocusedBinding<Bool>(\.editorShouldFocus) var editorShouldFocus
    
    var body: some View {
        TextEditor(text: $notes)
            .focused($editorShouldFocus)
            .background(Color.red)
            .border(Color.black)
            .onTapGesture {
                editorShouldFocus = true
            }
    }
}

struct FocusedEditorValue: FocusedValueKey {
    typealias Value = Binding<Bool>
}

extension FocusedValues {
    var editorShouldFocus: FocusedEditorValue.Value? {
        get { self[FocusedEditorValue.self] }
        set { self[FocusedEditorValue.self] = newValue }
    }
}


/*struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(notes: .constant("testing"), editorShouldFocus: FocusState<Bool>.Binding())
    }
}*/
