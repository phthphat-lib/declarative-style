//
//  File.swift
//  
//
//  Created by Phat Pham on 19/10/2021.
//

import UIKit

///Optional of `((T?) -> Void)` to make it escapable
public typealias CompleteHandle<T> = ((T?) -> Void)?

/**
 Show and handle dialog in declarative style, inspire by Flutter
 
 Dialog example:
 ```
  ----------
 |Are u sure|
 |          |
 |    OK    |
 |  Cancel  |
  ----------
 ```
```
 showDialog(self.view, Bool.self) { complt in
    VStackView(
        UILabel(text: "Are u sure")
        UIButton(text: "OK")
            .onEvent {
                complt?(true)
            }
        UIButton(text: "Cancel")
            .onEvent {
                complt?(false)
            }
    )
 } onResult: { result in
    guard let result = result
    else { print("Turned off dialog" }
    if result {
        print("Press OK")
    } else {
        print("Press Cancel")
    }
 }
 ```
 */
/// - Parameter parentView: the view which pop to show on top
/// - Parameter type: dialog return generic `T` model
/// - Parameter config: dialog config
/// - Parameter builder: a closure provide a `UIView` which has a handler parameter for you to decide whenever dialog should return a generic `T` model, note that call this handler will turn of dialog
/// - Parameter onResult: handle dialog return type (generic `T`)
public func showDialog<T>(
    _ parentView: UIView,
    _ type: T.Type,
    config: DialogConfig = .defaultCF,
    builder: (CompleteHandle<T>) -> UIView,
    onResult: CompleteHandle<T> = nil
) {
    let blackView = UIView()
    blackView.backgroundColor = .black.withAlphaComponent(0.8)
    parentView.addSubview(blackView)
    blackView.frame = parentView.bounds
    blackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    let complt = { (model: T?) in
        UIView.animate(withDuration: 0.2) {
            blackView.alpha = 0
        } completion: { isComplete in
            if isComplete {
                blackView.subviews.forEach { view in
                    view.removeFromSuperview()
                }
                blackView.removeFromSuperview()
            }
        }
        onResult?(model)
    }
    
    let view = WrapView(
        builder(complt),
        padding: config.contentPadding
    )
        .background(color: config.backgroundColor)
        .cornerRadius(config.cornerRadius)
    blackView.addSubview(view)
    
    if config.barrierDismissable {
        blackView.onTapGesture { ges in
            let point = ges.location(in: blackView)
            if !view.frame.contains(point) {
                complt(nil)
            }
        }
    }
    view.translatesAutoresizingMaskIntoConstraints = false
    [
        view.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: config.padLeftWithBlackView),
        view.topAnchor.constraint(greaterThanOrEqualTo: blackView.topAnchor, constant: 24),
        view.centerXAnchor.constraint(equalTo: blackView.centerXAnchor),
        view.centerYAnchor.constraint(equalTo: blackView.centerYAnchor),
    ].forEach { constraint in
        constraint.isActive = true
    }
}

public struct DialogConfig {
    public var backgroundColor = UIColor.white
    public var contentPadding = UIEdgeInsets.allSides(14)
    public var barrierDismissable = true
    public var cornerRadius: CGFloat = 10
    public var padLeftWithBlackView: CGFloat = 24
    
    public static var defaultCF = DialogConfig()
}

extension UIEdgeInsets {
    static public func allSides(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}
