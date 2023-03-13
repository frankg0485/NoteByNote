//
//  View+Modifiers.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/12/23.
//

import SwiftUI

extension View {
    public func alwaysPopover<Content>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View {
        self.modifier(AlwaysPopoverModifier(isPresented: isPresented, contentBlock: content))
    }
}
