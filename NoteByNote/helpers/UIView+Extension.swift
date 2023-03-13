//
//  UIView+Extension.swift
//  NoteByNote
//
//  Created by Frank Gao on 3/12/23.
//

import UIKit

extension UIView {
    func closestVC() -> UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if let vc = responder as? UIViewController {
                return vc
            }
            responder = responder?.next
        }
        return nil
    }
}
