# DeclarativeStyle

Write UIKit like HTML in declarative style (inspired by SwiftUI, Flutter)

Example:
```swift
let btn = UIButton()
    .with(100)
    .height(50)
    .cornerRadius(8)
    .onEvent(.primaryActionTriggered) {
        print("Button tapped")
    }
```