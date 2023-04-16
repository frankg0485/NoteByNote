//
//  NewSectionPopupView.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/12/23.
//

import SwiftUI

struct NewSectionPopupView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var newSection: Section
    @Binding var show: Bool
    
    @State private var size: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("New Section")
                .bold()
                .padding()
            
            TextField("name", text: $newSection.name)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 2)
                )
                .frame(maxWidth: size.width)
                .padding([.leading, .trailing])
            
            HStack {
                Spacer()
                    .frame(maxWidth: size.width)
                Button(action: {
                    newSection.name = ""
                    presentationMode.wrappedValue.dismiss()
                    show = false
                }) {
                    Text("Cancel")
                }
                Spacer()
                    .frame(maxWidth: size.width)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    show = false
                }) {
                    Text("Done")
                }
                Spacer()
                    .frame(maxWidth: size.width)
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.size.width * 0.75)
        .overlay(
            GeometryReader { proxy in
                HStack {} // just an empty container to trigger the onAppear
                    .onAppear {
                        size = proxy.size
                    }
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 5)
        )
        .interactiveDismissDisabled(true)
        .background(.white)
        
    }
}
