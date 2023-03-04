//
//  VideoPicker.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/3/23.
//

import SwiftUI
import PhotosUI
import AVKit

struct VideoPicker: View {
    @State private var videoSelection: PhotosPickerItem?
    @State private var movie: Movie?
    
    var body: some View {
        if let movie {
            VideoPlayer(player: AVPlayer(url: movie.url))
                                .scaledToFit()
                                .frame(width: 300, height: 300)
        }
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

struct VideoPicker_Previews: PreviewProvider {
    static var previews: some View {
        VideoPicker()
    }
}
