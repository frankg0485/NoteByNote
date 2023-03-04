//
//  ContentView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: String = ""
    var body: some View {
        VStack {
            VideoPicker()
            TextField("Your notes here", text: $notes)
                .border(Color.black)
                .padding(.all)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
