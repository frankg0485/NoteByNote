//
//  Double+Extension.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/13/23.
//

import Foundation

extension Double {
    func secondsToMMSSstr() -> String {
        return String.init(format: "%02.0f:%02.0f", floor(self / 60), floor (self.truncatingRemainder(dividingBy: 60)))
    }
}
