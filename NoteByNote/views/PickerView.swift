//
//  PickerView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import SwiftUI

enum ToolSelection : String, CaseIterable {
    case sections = "Sections"
    case notes = "Notes"
}

struct PickerView: View {
    @State private var segmentationSelection : ToolSelection = .sections
    @State private var sections : [Section] = []
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Picker("", selection: $segmentationSelection) {
                    ForEach(ToolSelection.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                switch segmentationSelection {
                case .sections:
                    SectionView(sections: $sections)
                        .frame(minHeight: proxy.size.height * 0.75)
                case .notes:
                    NotesView()
                        .frame(minHeight: proxy.size.height * 0.75)
                }
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
