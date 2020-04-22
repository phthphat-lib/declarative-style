//
//  AttributeString.swift
//  ExampleDeclarativeUIKit
//
//  Created by phthphat on 4/22/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import Foundation
import UIKit

public enum AttributeTextConfig {
    case foregroundColor(color: UIColor)
    case backgroundColor(color: UIColor)
    case font(font: UIFont)
    case underlineStyle(style: NSUnderlineStyle)
    case underlineColor(color: UIColor)
    case strokeColor(color: UIColor)
    case strokeWidth(value: CGFloat)
    case custom(value: [NSAttributedString.Key: Any])
}

extension String {
    public func withAttribute(_ config: AttributeTextConfig...) -> NSAttributedString {
        let attribute = config.reduce([NSAttributedString.Key: Any]()) { pre, item in
            var newAttribute = pre
            switch item {
            case .backgroundColor(let color):
                newAttribute[NSAttributedString.Key.backgroundColor] = color
            case .foregroundColor(let color):
                newAttribute[NSAttributedString.Key.foregroundColor] = color
            case .font(let font):
                newAttribute[NSAttributedString.Key.font] = font
            case .underlineStyle(let style):
                newAttribute[NSAttributedString.Key.underlineStyle] = style.rawValue
            case .underlineColor(let color):
                newAttribute[NSAttributedString.Key.underlineColor] = color
            case .strokeColor(let color):
                newAttribute[NSAttributedString.Key.strokeColor] = color
            case .strokeWidth(let value):
                newAttribute[NSAttributedString.Key.strokeWidth] = value
            case .custom(let value):
                value.forEach { (key, val) in newAttribute[key] = val }
            }
            return newAttribute
        }
        return NSAttributedString(string: self, attributes: attribute)
    }
}

extension NSAttributedString {
    static public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
        
        let attributeText = NSMutableAttributedString(attributedString: lhs)
        attributeText.append(rhs)
        return attributeText
    }
    static public func +=(lhs: inout NSAttributedString, rhs: NSAttributedString) {
        lhs = lhs + rhs
    }
}
