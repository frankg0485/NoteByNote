//
//  NotesView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/9/23.
//

import SwiftUI

struct NotesView: View {
    @State private var notes: String = ""
    @FocusState private var editorShouldFocus: Bool
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                TextEditor(text: $notes)
                    .focused($editorShouldFocus)
                    .background(Color.red)
                    .border(Color.black)
                    .onTapGesture {
                        editorShouldFocus = true
                    }
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("Done") {
                                editorShouldFocus = false
                            }
                        }
                    }
            }
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
