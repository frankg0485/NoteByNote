//
//  TabView.swift
//  NoteByNote
//
//  Created by Frank Gao on 6/17/23.
//

import SwiftUI

struct NBNTabBar: View {
    var body: some View {
        TabView {
            ProjectList()
                .tabItem {
                    Label("Projects", systemImage: "tray.and.arrow.down.fill")
                }
            
            Text("Settings Page Placeholder")
                .tabItem {
                    Label("Settings", systemImage: "tray.and.arrow.down.fill")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        NBNTabBar()
    }
}
