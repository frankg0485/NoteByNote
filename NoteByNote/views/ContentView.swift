//
//  ContentView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                VideoView()
                    .frame(height: proxy.size.height * 0.5)
                PickerView()
            }
            .padding()
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
        }
        .contentShape(Rectangle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
