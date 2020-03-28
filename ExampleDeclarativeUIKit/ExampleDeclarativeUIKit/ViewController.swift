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
        vstack(
            UITextField().setUp({ tf in
                tf.placeholder = "Type me"
            })
                .with(height: 130),
            UIView(backgroundColor: .systemYellow),
            hstack(
                UIButton(title: "Left", titleColor: .systemBlue, target: self, action: #selector(pressLeftBtn)),
                UIButton(title: "Middle", titleColor: .systemBlue)
                    .withTap(target: self, action: #selector(pressMiddleBtn), for: .touchUpInside),
                UIButton(title: "Right", titleColor: .systemBlue, target: self, action: #selector(pressRightBtn)),
                
                vstack(
                    UIView(backgroundColor: .purple),
                    UIView(backgroundColor: .systemPink),
                    spacing: 20,
                    distribution: .fillEqually
                ).with(margins: .allSides(10)),
                
                distribution: .fillEqually
            ).with(height: 100),
            
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

