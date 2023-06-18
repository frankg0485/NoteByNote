//
//  Note.swift
//  NoteByNote
//
//  Created by Frank Gao on 5/27/23.
//

import Foundation
import SwiftUI

class Note: Identifiable {
    internal let id = UUID()
    private var timestamp: Double?
    private var text: String
    
    convenience init(text: String) {
        self.init(text: text, timestamp: nil)
    }
    
    required init(text: String, timestamp: Double?) {
        self.text = text
        self.timestamp = timestamp
    }
    
    func getID() -> UUID {
        return id
    }
    
    func getTimestamp() -> Double? {
        return timestamp
    }
    
    func setTimestamp(_ timestamp: Double) {
        self.timestamp = timestamp
    }
    
    func getText() -> String {
        return text
    }
    
    func setText(_ text: String) {
        self.text = text
    }
}
