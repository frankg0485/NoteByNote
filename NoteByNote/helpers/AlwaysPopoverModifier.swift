//
//  AlwaysPopoverModifier.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/12/23.
//

import SwiftUI

struct AlwaysPopoverModifier<PopoverContent>: ViewModifier where PopoverContent: View {
    
    let isPresented: Binding<Bool>
    let contentBlock: () -> PopoverContent
    
    // Workaround for missing @StateObject in iOS 13.
    private struct Store {
        var anchorView = UIView()
    }
    @State private var store = Store()
    
    func body(content: Content) -> some View {        
        if isPresented.wrappedValue {
            presentPopover()
        }
        
        return content
            .background(InternalAnchorView(uiView: store.anchorView))
    }
    
    private func presentPopover() {
        let contentController = ContentViewController(rootView: contentBlock(), isPresented: isPresented)
        contentController.modalPresentationStyle = .popover
        
        guard let popover = contentController.popoverPresentationController else { return }
        
        guard let view = store.anchorView.closestVC()!.view else { return }
        
        popover.sourceView = view
        popover.sourceRect = view.bounds
        //popover.sourceRect = CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 0, height: 0)
        popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover.delegate = contentController
        
        guard let sourceVC = view.closestVC() else { return }
        /*if let presentedVC = sourceVC.presentedViewController {
            presentedVC.dismiss(animated: true) {
                sourceVC.present(contentController, animated: true)
            }
        } else {*/
        sourceVC.present(contentController, animated: true)
        //}
    }
    
    private struct InternalAnchorView: UIViewRepresentable {
        typealias UIViewType = UIView
        let uiView: UIView
        
        func makeUIView(context: Self.Context) -> Self.UIViewType {
            uiView
        }
        
        func updateUIView(_ uiView: Self.UIViewType, context: Self.Context) {}
    }
}
