//
//  AudioSlider.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/4/23.
//

import SwiftUI

struct AudioSlider: View {
    @Binding var value: Double
    @Binding var durationInSeconds: Double
    @Binding var dragging: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(String.init(format: "%02.0f:%02.0f", floor(value / 60), floor(value.truncatingRemainder(dividingBy: 60))))
                Spacer()
                Text(String.init(format: "%02.0f:%02.0f", floor(durationInSeconds / 60), floor (durationInSeconds.truncatingRemainder(dividingBy: 60))))
            }
            Slider(value: $value, in: 0...durationInSeconds) { isDragging in
                dragging = isDragging
            }
        }
        .padding(.all)
    }
}

struct AudioSlider_Previews: PreviewProvider {
    static var previews: some View {
        AudioSlider(value: .constant(10.0), durationInSeconds: .constant(0), dragging: .constant(false))
    }
}
