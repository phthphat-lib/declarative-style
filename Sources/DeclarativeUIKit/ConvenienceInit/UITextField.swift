//
//  UITextField.swift
//
//  Created by Brian Voong on 5/7/19.
//

import UIKit

extension UITextField {

    public convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
    
    @discardableResult
    open func onTextChange(_ target: Any, action: Selector) -> UITextField {
        self.addTarget(target, action: action, for: .valueChanged)
        return self
    }
}
