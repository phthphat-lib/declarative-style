//
//  UIView+TargetEvent.swift
//  
//
//  Created by Lucas Pham on 3/20/20.
//

import Foundation
import UIKit

public protocol EventDeclarative {}

@available(iOS 11.0, *)
extension EventDeclarative where Self: UIView {
    
    @discardableResult
    public func withTapGesture(_ target: Any, selector: Selector) -> Self {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(tapGesture)
        return self
    }
}

extension EventDeclarative where Self: UIButton {
    @discardableResult
    public func withTap(target: Any, action: Selector, for event: UIControl.Event) -> Self {
        self.addTarget(target, action: action, for: event)
        return self
    }
}

extension EventDeclarative where Self: UITextField {
    @discardableResult
    public func onTextChange(_ target: Any, action: Selector) -> Self {
        self.addTarget(target, action: action, for: .valueChanged)
        return self
    }
}
