//
//  ProjectListNavBar.swift
//  NoteByNote
//
//  Created by Frank Gao on 6/18/23.
//

import SwiftUI

struct ProjectListNavBar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "plus.circle")
                .onTapGesture {
                    print("tapped")
                }
        }
        
        ToolbarItem(placement: .navigationBarLeading) {
            Image(systemName: "trash.circle")
        }
    }
}
