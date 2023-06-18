//
//  Section.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import SwiftUI

class Section: Identifiable {
    internal let id = UUID()
    private var name: String
    private var startTime: Double
    private var endTime: Double
    
    init(name: String, startTime: Double, endTime: Double) {
        guard startTime <= endTime else {
            fatalError("section start time can't be larger than the end time")
        }

        self.name = name
        self.startTime = startTime
        self.endTime = startTime
    }
    
    func getID() -> UUID {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func getStartTime() -> Double {
        return startTime
    }
    
    func setStartTime(_ startTime: Double) {
        self.startTime = startTime
    }
    
    func getEndTime() -> Double {
        return endTime
    }
    
    func setEndTime(_ endTime: Double) {
        self.endTime = endTime
    }
}
