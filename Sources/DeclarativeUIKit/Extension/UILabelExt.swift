//
//  UILabelExt.swift
//  
//
//  Created by Lucas Pham on 4/3/20.
//

import UIKit


extension UILabel {
    static public func +(lhs: UILabel, rhs: UILabel) -> UILabel {
        guard lhs.attributedText != nil, let att2 = rhs.attributedText else {
            return lhs
        }
        lhs.attributedText! += att2
        return lhs
    }
    static public func +(lhs: UILabel, rhs: String) -> UILabel {
        guard lhs.text != nil else { return lhs }
        lhs.text! += rhs
        return lhs
    }
}
