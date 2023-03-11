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
        GeometryReader { proxy in
            VStack {
                VideoView()
                NotesView(notes: $notes, editorShouldFocus: $textEditorShouldFocus)
                .frame(height: proxy.size.height * 0.33)
            }
            .padding()
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
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
