//
//  ViewController.swift
//  TestDeclarativeUIKit
//
//  Created by Lucas Pham on 3/7/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import UIKit

class TestScrollVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        vscroll(
            UIView(backgroundColor: .systemBlue).with(height: 300),
            UITextField().withSetUp({ tf in
                tf.placeholder = "Type me"
            }),
            UIView(backgroundColor: .systemYellow)
                .with(height: 200),
            UIView(backgroundColor: .systemGreen)
                .withTapGesture(self, selector: #selector(tapOnBottomView))
                .with(height: 200),
            UIView(backgroundColor: .red).with(height: 300)
        )
        
//        vstack(
//            UIView(backgroundColor: .red)
//        )
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



#if DEBUG
import SwiftUI
struct PresentableTestScrollVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TestScrollVC {
		let vc = TestScrollVC()
		return vc 
    }
    func updateUIViewController(_ uiViewController: TestScrollVC, context: Context) { }
}
struct TestScrollVCPreview: PreviewProvider {
    static var previews: some View {
        return PresentableTestScrollVC()
    }
}
#endif
