//
//  UIViewApperanceExtension.swift
//
//  Created by phat on 25/02/2021.
//

import Foundation
import UIKit

extension UIView {
    @discardableResult
    public func border(color: UIColor, width: CGFloat = 1) -> Self {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    public func background(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func background(view: UIView, inSafeArea: Bool = true) -> Self {
        self.insertSubview(view, at: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *), inSafeArea {
                view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
                view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
                view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
                view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        } else {
            view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func cornerRadius(_ value: CGFloat) -> Self {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = value
        return self
    }
    
    @discardableResult
    public func hidden(_ hidden: Bool) -> Self {
        if isHidden != hidden {
            isHidden = hidden
        }
        return self
    }
    
    @discardableResult
    public func userInteractive(_ enable: Bool) -> Self {
        self.isUserInteractionEnabled = enable
        return self
    }
}

extension UITextView {
    @discardableResult
    public func customFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
}
