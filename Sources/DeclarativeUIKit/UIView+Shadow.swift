//
//  File.swift
//  
//
//  Created by Lucas Pham on 12/24/19.
//

import Foundation
import UIKit

// MARK: Shadow
public extension UIView {
    func endOfView() -> CGFloat {
        return (self.frame.origin.y+self.frame.size.height)
    }
    @discardableResult
    func withShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, cornerRadius: CGFloat? = nil, scale: Bool = true) -> UIView {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        if let cornerRad = cornerRadius {
            layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRad).cgPath
        } else {
            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        }
        
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        return self
    }
    @discardableResult
    func withBorder(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear, cornerRadius: CGFloat) -> UIView {
        self.layer.masksToBounds        = true
        self.layer.borderWidth          = borderWidth
        self.layer.borderColor          = borderColor.cgColor
        self.layer.cornerRadius         = cornerRadius
        return self
    }
}
