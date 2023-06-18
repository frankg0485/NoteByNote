//
//  Project.swift
//  NoteByNote
//
//  Created by Frank Gao on 5/27/23.
//

import Foundation
import SwiftUI

class Project {
    private let id = UUID()
    private var name: String
    private var video: Video
    private var notes: [Note]
    private var createdDate: Date
    
    init(name: String, video: Video) {
        self.name = name
        self.video = video
        self.notes = []
        self.createdDate = Date.now
    }
    
    func getID() -> UUID {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(_ name: String) {
        //TODO: make sure name is valid
        self.name = name
    }
    
    func getVideo() -> Video {
        return video
    }
    
    func setVideo(_ video: Video) {
        self.video = video
    }
    
    func getNotes() -> [Note] {
        return notes
    }
    
    func addNote(_ note: Note) {
        notes.append(note)
    }
    
    func removeNote(_ id: UUID) {
        //TODO: error handling
        notes.remove(at: notes.firstIndex(where: { $0.getID() == id })!)
    }
    
    func getCreatedDate() -> Date {
        return createdDate
    }
}
