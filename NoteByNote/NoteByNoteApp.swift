//
//  NoteByNoteApp.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/3/23.
//

import SwiftUI

@main
struct NoteByNoteApp: App {
    @StateObject private var videoInfo = VideoInfo()
    
    var body: some Scene {
        WindowGroup {
            NBNTabBar()
                .environmentObject(videoInfo)
        }
    }
}
