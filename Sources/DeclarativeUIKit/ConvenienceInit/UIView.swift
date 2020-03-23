//
//  File.swift
//  
//
//  Created by Lucas Pham on 3/23/20.
//

import UIKit

extension UIView {
    convenience public init(backgroundColor: UIColor = .clear) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
}
