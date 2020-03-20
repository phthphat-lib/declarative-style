//
//  ViewController.swift
//  TestDeclarativeUIKit
//
//  Created by Lucas Pham on 3/7/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import UIKit
import DeclarativeUIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.vstack(
            UIView(backgroundColor: .systemYellow),
            
            UIView().hstack(
                UIButton(title: "Left", titleColor: .systemBlue, target: self, action: #selector(pressLeftBtn)),
                UIButton(title: "Middle", titleColor: .systemBlue, target: self, action: #selector(pressMiddleBtn)),
                UIButton(title: "Right", titleColor: .systemBlue).withTap(target: self, action: #selector(pressRightBtn), for: .touchUpOutside),
                distribution: .fillEqually
            ),
            
            UIView(backgroundColor: .systemGreen)
                .withTapGesture(self, selector: #selector(tapOnBottomView))
                .with(height: 200)
        )
    }
    
    @objc func pressLeftBtn() {
        print("Left")
    }
    @objc func pressMiddleBtn() {
        print("Middle")
    }
    @objc func pressRightBtn() {
        print("Right")
    }

    @objc func tapOnBottomView() {
        print("Tap on bottom view")
    }
    
}

