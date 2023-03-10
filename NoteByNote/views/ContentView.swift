//
//  ContentView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: String = ""
    @FocusState private var textEditorShouldFocus: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VideoView()
                NotesView(notes: $notes, editorShouldFocus: $textEditorShouldFocus)
                .frame(height: geometry.size.height * 0.33)
            }
            .padding()
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            textEditorShouldFocus = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
