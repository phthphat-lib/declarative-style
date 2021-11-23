//
//  File.swift
//  
//
//  Created by Phat Pham on 15/10/2021.
//

import UIKit

public class CenterView: UIView {
    public init(_ view: UIView, padLeftTop: CGPoint = .zero) {
        super.init(frame: .zero)
        
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        view.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: padLeftTop.x).isActive = true
        view.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: padLeftTop.y).isActive = true
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//Helper for stack view with appearance
open class WrapView: UIView {
    /// Wrap a view with padding
    public init(_ view: UIView, padding: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) {
        super.init(frame: .zero)
        self.addSubview(view)
        view.fillSuperview(padding: padding, inSafeArea: false)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
