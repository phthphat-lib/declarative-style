//
//  File.swift
//  
//
//  Created by Phat Pham on 03/07/2021.
//

import UIKit

extension UIView {
    
    @discardableResult
    public func size(_ value: CGSize) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: value.width).isActive = true
        heightAnchor.constraint(equalToConstant: value.height).isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ value: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: value).isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ value: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: value).isActive = true
        return self
    }
    
    /// Ratio: width / height
    @discardableResult
    public func ratio(_ value: CGFloat, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: value, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    public func contentCompressPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
}
