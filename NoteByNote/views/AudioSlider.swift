//
//  AudioSlider.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/4/23.
//

import SwiftUI

struct AudioSlider: View {
    @Binding var value: Float
    @Binding var dragging: Bool
    
    var body: some View {
        Slider(value: $value) { isDragging in
            dragging = isDragging
        }
            .padding(.all)
    }
}

struct AudioSlider_Previews: PreviewProvider {
    static var previews: some View {
        AudioSlider(value: .constant(10.0), dragging: .constant(false))
    }
}
