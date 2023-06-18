//
//  ProjectListView.swift
//  NoteByNote
//
//  Created by Frank Gao on 6/17/23.
//

import SwiftUI

struct ProjectList: View {
    //TODO: build project list
    var dummyList: [String] = ["Project 1", "Project 2"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dummyList, id: \.self) { project in
                    NavigationLink {
                        ProjectView()
                    } label: {
                        Text(project)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ProjectListNavBar()
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectList()
    }
}
