//
//  Video.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/4/23.
//

import SwiftUI
import AVFoundation

//TODO: conform to Equatable
class Video: Transferable, Equatable {
    private let url: URL
    private var duration: Double
    private var timestamp: Double
    private var player: AVPlayer
    //TODO: looping

    static func == (lhs: Video, rhs: Video) -> Bool {
        return lhs.url == rhs.url
    }
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { received in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")
            
            //delete the file at the intended save location if it already exists
            if FileManager.default.fileExists(atPath: copy.path()) {
                try FileManager.default.removeItem(at: copy)
            }

            //saves a copy of the received video in a location which our app can access
            try FileManager.default.copyItem(at: received.file, to: copy)
            return Self.init(url: copy)
        }
    }
    
    required init(url: URL) {
        self.url = url
        self.player = AVPlayer(url: self.url)
        self.duration = player.currentItem!.duration.seconds * 1000
        self.timestamp = 0
    }
}
