//
//  VideoInfo.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import Foundation
import Combine

final class VideoInfo: ObservableObject {
    @Published var video: Movie?
    @Published var timestampInSeconds: Double = 0.0
    var timeStampSelected = false
}
