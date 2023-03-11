//
//  VideoPlayerView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @Binding var player: AVPlayer?
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VideoPlayer(player: player)
                    .scaledToFit()
                    .allowsHitTesting(false)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                guard let player else {
                    return
                }
                
                if (player.timeControlStatus == .paused) {
                    player.play()
                } else if (player.timeControlStatus == .playing) {
                    player.pause()
                }
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(player: .constant(AVPlayer()))
    }
}
