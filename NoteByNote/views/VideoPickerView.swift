//
//  VideoPickerView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/4/23.
//

import SwiftUI
import PhotosUI

struct VideoPickerView: View {
    @Binding var movie: Movie?
    @State private var videoSelection: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(selection: $videoSelection,
                     matching: .videos,
                     photoLibrary: .shared()) {
            Text("Select Video")
        }
        .onChange(of: videoSelection) { newItem in
            Task {
                if let video = try? await newItem?.loadTransferable(type: Movie.self) {
                    movie = video
                }
            }
        }
    }
}

struct VideoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPickerView(movie: .constant(Movie(url: URL(string: "file:///Users/fgao/Downloads/IMG_0909.mov")!, movieChanged: true)))
    }
}
