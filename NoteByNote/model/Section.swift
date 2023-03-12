//
//  Section.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import SwiftUI

struct Section {
    var name: String
    var startTimeInSeconds: Float
    var endTimeInSeconds: Float
    
    init(name: String, startTimeInSeconds: Float, endTimeInSeconds: Float) {
        guard startTimeInSeconds <= endTimeInSeconds else {
            fatalError("section start time can't be larger than the end time")
        }
        
        self.name = name
        self.startTimeInSeconds = startTimeInSeconds
        self.endTimeInSeconds = endTimeInSeconds
    }
}
