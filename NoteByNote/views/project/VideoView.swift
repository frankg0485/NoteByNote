//
//  VideoPicker.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/3/23.
//

import SwiftUI
import PhotosUI
import AVKit

//TODO: move some views to ProjectView
struct VideoView: View {
    @EnvironmentObject var videoInfo: VideoInfo
    
    @State private var sliderIsBeingDragged: Bool = false
    
    @State private var player: AVPlayer?
    @State private var duration: Double = 0
    
    @State private var timeObserver: Any?
    
    private func addTimeObserver() {
        let interval = CMTime(seconds: 0.01, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player!.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: { time in
            // only update the slider value if is not currently being dragged
            if !sliderIsBeingDragged && !videoInfo.timeStampSelected {
                let currentSeconds = CMTimeGetSeconds(time)
                videoInfo.timestampInSeconds = currentSeconds
            }
        })
    }
    
    private func updatePlayer() {
        let newTime = CMTimeMakeWithSeconds(videoInfo.timestampInSeconds, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player!.currentItem?.seek(to: newTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero, completionHandler: nil)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                if videoInfo.video != nil {
                    VideoPlayerView(player: $player)
                        .frame(width: proxy.size.width * 0.75, height: proxy.size.width * 0.75)
                } else {
                    Text("No video selected")
                }
                
                VideoPickerView()
                    .onChange(of: videoInfo.video) { changed in
                        Task {
                            if player == nil {
                                player = AVPlayer()
                            }
                            //player?.replaceCurrentItem(with: AVPlayerItem(url: videoInfo.video!.url))
                            
                            if let loadedDuration = try await player?.currentItem?.asset.load(.duration).seconds {
                                duration = loadedDuration
                            }
                            
                            //videoInfo.video?.movieChanged = false
                            if (timeObserver == nil) { addTimeObserver() }
                        }
                    }
                
                if (videoInfo.video != nil && duration > 0) {
                    AudioSlider(value: $videoInfo.timestampInSeconds, durationInSeconds: $duration, dragging: $sliderIsBeingDragged)
                        .onChange(of: videoInfo.timestampInSeconds) { newValue in
                            //either slider dragged or timestamp was selected(in section or notes views)
                            if (sliderIsBeingDragged || videoInfo.timeStampSelected) {
                                videoInfo.timestampInSeconds = Double(newValue)
                                if videoInfo.timeStampSelected { videoInfo.timeStampSelected = false }
                                updatePlayer()
                            }
                        }
                    PickerView()
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
