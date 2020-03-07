//
//  UIView+Stacking.swift
//
//  Created by Brian Voong on 4/28/19.
//  Copyright © 2019 Tieda Wei. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
extension UIView {
    
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.fillSuperviewSafeAreaLayoutGuide()
        return stackView
    }
    //MARK: Declarative programing
    @discardableResult
    open func vstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.vertical, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    open func hstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    open func with<T: UIView>(size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    @discardableResult
    open func with(height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    open func with(width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    func withBorder<T: UIView>(width: CGFloat, color: UIColor) -> T {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self as! T
    }
    
    @discardableResult
    open func with(backgroundColor: UIColor) -> UIView {
        self.backgroundColor = backgroundColor
        return self
    }
    @discardableResult
    open func with(cornerRadius: CGFloat) -> UIView {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    open func with(frame: CGRect) -> UIView {
        self.frame = frame
        return self
    }
    @discardableResult
    open func withRoundCorners(rectCorner: UIRectCorner, radius: CGFloat) -> UIView {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        return self
    }
    @discardableResult
    open func withTapGesture(_ target: Any, selector: Selector) -> UIView {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(tapGesture)
        return self
    }
}

extension CGSize {
    static public func equalEdge(_ edge: CGFloat) -> CGSize {
        return .init(width: edge, height: edge)
    }
}

extension UIEdgeInsets {
    static public func allSides(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}
