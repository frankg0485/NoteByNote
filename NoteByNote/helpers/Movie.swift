//
//  Movie.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/4/23.
//

import SwiftUI

struct Movie: Transferable, Equatable {
    let url: URL
    var movieChanged: Bool
    
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
            return Self.init(url: copy, movieChanged: true)
        }
    }
}
