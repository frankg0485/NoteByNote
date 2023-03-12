//
//  VideoPickerView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/4/23.
//

import SwiftUI
import PhotosUI

struct VideoPickerView: View {
    @EnvironmentObject var videoInfo: VideoInfo
    @State private var videoSelection: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(selection: $videoSelection,
                     matching: .videos,
                     preferredItemEncoding: .current,
                     photoLibrary: .shared()) {
            Text("Select Video")
        }
        .onChange(of: videoSelection) { newItem in
            Task {
                if let video = try? await newItem?.loadTransferable(type: Movie.self) {
                    videoInfo.video = video
                }
            }
        }
    }
}

struct VideoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPickerView()
    }
}
