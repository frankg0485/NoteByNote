//
//  VideoPicker.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/3/23.
//

import SwiftUI
import PhotosUI
import AVKit

struct VideoView: View {
    @State private var movie: Movie?
    
    @State private var sliderValue: Float = 0.0
    @State private var sliderIsBeingDragged: Bool = false
    
    @State private var player: AVPlayer?
    @State private var playerTime: CMTime?
    @State private var duration: Double = 0
    
    @State private var timeObserver: Any?

    private func addTimeObserver() {
        let interval = CMTime(seconds: 0.01, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player!.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: { time in
            // only update the slider value if is not currently being dragged
            if !sliderIsBeingDragged {
                let currentSeconds = Float(CMTimeGetSeconds(time))
                self.sliderValue = currentSeconds
            }
        })
    }
    
    private func updatePlayer(sliderVal: Float) {
        let newTime = CMTimeMakeWithSeconds(Double(sliderVal), preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player!.currentItem?.seek(to: newTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero, completionHandler: nil)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                if movie != nil {
                    VideoPlayerView(player: $player)
                        .frame(width: proxy.size.width * 0.75, height: proxy.size.width * 0.75)
                } else {
                    Text("No video selected")
                }
                
                VideoPickerView(movie: $movie)
                    .onChange(of: movie?.movieChanged) { changed in
                        Task {
                            if player == nil {
                                player = AVPlayer()
                            }
                            player?.replaceCurrentItem(with: AVPlayerItem(url: movie!.url))
                            
                            if let loadedDuration = try await player?.currentItem?.asset.load(.duration).seconds {
                                duration = loadedDuration
                            }
                            
                            movie?.movieChanged = false
                            if (timeObserver == nil) { addTimeObserver() }
                        }
                    }
                
                if (movie != nil && duration > 0) {
                    AudioSlider(value: $sliderValue, durationInSeconds: $duration, dragging: $sliderIsBeingDragged)
                        .onChange(of: sliderValue) { newValue in
                            if (sliderIsBeingDragged) {
                                updatePlayer(sliderVal: newValue)
                            }
                        }
                }
            }
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
        }
    }
}

struct VideoPicker_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
