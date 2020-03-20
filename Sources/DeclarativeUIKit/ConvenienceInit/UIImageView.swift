//
//  UIImageView.swift
//  
//
//  Created by Lucas Pham on 12/18/19.
//

import Foundation
import UIKit

extension UIImageView {
    convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init(image: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
}
