//
//  SectionView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import SwiftUI

struct SectionView: View {
    private var sections = [
        Section(name: "Introduction", startTimeInSeconds: 232, endTimeInSeconds: 339),
        Section(name: "Development", startTimeInSeconds: 453, endTimeInSeconds: 557),
        Section(name: "Recapitulation", startTimeInSeconds: 674, endTimeInSeconds: 789)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    // handle button tap
                }) {
                    Image(systemName: "plus")
                }
                .frame(alignment: .leading)
            }
            .padding()
            ScrollView {
                ForEach(sections, id: \.name) {section in
                    HStack {
                        Text(section.name)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text(String.init(format: "%02.0f:%02.0f", floor(section.startTimeInSeconds / 60), floor(section.startTimeInSeconds.truncatingRemainder(dividingBy: 60))))
                        }
                        Button(action: {
                            
                        }) {
                            Text(String.init(format: "%02.0f:%02.0f", floor(section.endTimeInSeconds / 60), floor (section.endTimeInSeconds.truncatingRemainder(dividingBy: 60))))
                        }
                        
                    }
                    .padding()
                }
            }
        }
        .border(.black)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
