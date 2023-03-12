//
//  Section.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import SwiftUI

struct Section {
    var name: String
    var startTimeInSeconds: Double
    var endTimeInSeconds: Double
    
    init(name: String, startTimeInSeconds: Double, endTimeInSeconds: Double) {
        guard startTimeInSeconds <= endTimeInSeconds else {
            fatalError("section start time can't be larger than the end time")
        }
        
        self.name = name
        self.startTimeInSeconds = startTimeInSeconds
        self.endTimeInSeconds = endTimeInSeconds
    }
}
