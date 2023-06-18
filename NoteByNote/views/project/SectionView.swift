//
//  SectionView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/11/23.
//

import SwiftUI

struct SectionView: View {
    @EnvironmentObject var videoInfo: VideoInfo
    @Binding var sections: [Section]
    
    @State private var isCreatingSection: Bool = false
    @State private var startTimeChosen: Bool = false
    @State private var presentNewSectionPopup: Bool = false
    
    //placeholder for when a new section is being created
    @State private var newSection: Section = Section(name: "", startTime: 0, endTime: 0)
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    if isCreatingSection {
                        Text(String.init(format: "%02.0f:%02.0f", floor(videoInfo.timestampInSeconds / 60), floor(videoInfo.timestampInSeconds.truncatingRemainder(dividingBy: 60))))
                        Button(action: {
                            if !startTimeChosen {
                                newSection.setStartTime(videoInfo.timestampInSeconds)
                            } else {
                                newSection.setEndTime(videoInfo.timestampInSeconds)
                                presentNewSectionPopup = true
                                isCreatingSection = false
                            }
                            startTimeChosen.toggle()
                        }) {
                            Image(systemName: "checkmark")
                        }
                        .alwaysPopover(isPresented: $presentNewSectionPopup) {
                            NewSectionPopupView(newSection: $newSection, show: $presentNewSectionPopup)
                        }
                        
                        
                        Spacer()
                        
                        if !startTimeChosen {
                            Text("Choose start time")
                        } else {
                            Text("Choose end time")
                        }
                    }
                    
                    Spacer()
                        .onChange(of: presentNewSectionPopup) { present in
                            if !present && !newSection.getName().isEmpty {
                                //add the section to the array
                                sections.append(newSection)
                                
                                //clear the newSection variable
                                newSection = Section(name: "", startTime: 0, endTime: 0)
                            }
                        }
                    
                    Button(action: {
                        isCreatingSection.toggle()
                        if !isCreatingSection { startTimeChosen = false }
                    }) {
                        if !isCreatingSection {
                            Image(systemName: "plus")
                        } else {
                            Text("Cancel")
                        }
                    }
                }
                .padding()
                
                if !sections.isEmpty {
                    ScrollView {
                        ForEach(sections, id: \.self.id) {section in
                            HStack {
                                Text(section.getName())
                                Spacer()
                                Button(action: {
                                    videoInfo.timeStampSelected = true
                                    videoInfo.timestampInSeconds = section.getStartTime()
                                }) {
                                    //Text(String.init(format: "%02.0f:%02.0f", floor(section.startTimeInSeconds / 60), floor(section.startTimeInSeconds.truncatingRemainder(dividingBy: 60))))
                                }
                                Button(action: {
                                    videoInfo.timeStampSelected = true
                                    videoInfo.timestampInSeconds = section.getEndTime()
                                }) {
                                    //Text(String.init(format: "%02.0f:%02.0f", floor(section.endTimeInSeconds / 60), floor (section.endTimeInSeconds.truncatingRemainder(dividingBy: 60))))
                                }
                                
                            }
                            .padding()
                        }
                    }
                } else {
                    Text("No Sections")
                        .padding()
                }
            }
            .border(.black)
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(sections: .constant([]))
    }
}
