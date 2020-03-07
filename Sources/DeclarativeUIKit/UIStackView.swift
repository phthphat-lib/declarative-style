//
//  UIStackView+Extension.swift
//
//  Created by Brian Voong on 4/28/19.
//

import Foundation
import UIKit

@available(iOS 10.0, *)
extension UIStackView {
    open func addArrangedSubview(_ views: [UIView]) {
        views.forEach({ self.addArrangedSubview($0) })
    }
    
    @discardableResult
    open func with(margins: UIEdgeInsets) -> UIStackView {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    open func pad(left: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = left
        return self
    }
    
    @discardableResult
    open func pad(top: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = top
        return self
    }
    
    @discardableResult
    open func pad(bottom: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = bottom
        return self
    }
    
    @discardableResult
    open func pad(right: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = right
        return self
    }
}
