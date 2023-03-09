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
    @State private var sliderValue: Float = 5.0
    @State private var sliderIsBeingDragged: Bool = false
    @State private var player: AVPlayer?
    @State private var playerTime: CMTime?
    
    @State private var timeObserver: Any?
    
    private func addTimeObserver() {
        let interval = CMTime(seconds: 0.2, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player!.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: { time in
            let currentSeconds = Float(CMTimeGetSeconds(time))
            let durationSeconds = Float(CMTimeGetSeconds(player!.currentItem?.duration ?? CMTime.zero))
            self.sliderValue = currentSeconds / durationSeconds
        })
    }
    
    var body: some View {
        if movie != nil {
            VideoPlayer(player: player)
                .scaledToFit()
                .frame(width: 300, height: 300)
        } else {
            Text("No video selected")
        }
        
        VideoPickerView(movie: $movie)
            .onChange(of: movie) { newMovie in
                player = AVPlayer(url: newMovie!.url)
                addTimeObserver()
            }
        
        if (movie != nil) {
            AudioSlider(value: $sliderValue, dragging: $sliderIsBeingDragged)
                .onChange(of: sliderValue) { newValue in
                    if (sliderIsBeingDragged) {
                        if (timeObserver != nil) {
                            player!.removeTimeObserver(timeObserver!)
                            timeObserver = nil
                        }
                        let newTime = CMTimeMakeWithSeconds(Double(newValue) * (player!.currentItem?.duration.seconds)!, preferredTimescale: 1)
                        player!.currentItem?.seek(to: newTime, completionHandler: nil)
                    } else {
                        addTimeObserver()
                    }
                }
        }
    }
}

struct VideoPicker_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
