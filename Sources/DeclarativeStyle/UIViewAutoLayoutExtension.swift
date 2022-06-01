extension UIView {
    @discardableResult
    public func stackUpper(_ view: UIView, options: StackOption...) -> UIView {
        self.addSubview(view)
        var anchorsNeedLowPriority: Set<NSLayoutConstraint> = []
        for option in options {
            switch option {
            case .top(let value):
                anchorsNeedLowPriority.insert(self.topAnchor.constraint(equalTo: view.topAnchor, constant: -value))
            case .bottom(let value):
                anchorsNeedLowPriority.insert(self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: value))
            case .left(let value):
                anchorsNeedLowPriority.insert(
                    self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -value)
                )
            case .right(let value):
                anchorsNeedLowPriority.insert(
                    self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: value)
                )
            case .centerLeft:
                anchorsNeedLowPriority.insert(
                    self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                )
                let anchor = self.leadingAnchor.constraint(equalTo: view.leadingAnchor)
                anchorsNeedLowPriority.insert(anchor)
                anchor.priority = .defaultLow
            case .centerRight:
                anchorsNeedLowPriority.insert(
                    self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                )
                let anchor = self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                anchorsNeedLowPriority.insert(anchor)
            case .centerTop:
                anchorsNeedLowPriority.insert(
                    self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                )
                let anchor = self.topAnchor.constraint(equalTo: view.topAnchor)
                anchorsNeedLowPriority.insert(anchor)
            case .centerBottom:
                anchorsNeedLowPriority.insert(
                    self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                )
                anchorsNeedLowPriority.insert(
                    self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                )
            case .center:
                anchorsNeedLowPriority.insert(
                    self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                )
                anchorsNeedLowPriority.insert(
                    self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                )
            }
        }
        for anchor in anchorsNeedLowPriority {
            anchor.priority = .defaultLow
            anchor.isActive = true
        }
        return self
    }
}

public enum StackOption {
    case top(_ value: CGFloat)
    case left(_ value: CGFloat)
    case bottom(_ value: CGFloat)
    case right(_ value: CGFloat)
    
    case centerLeft, centerRight, centerTop, centerBottom, center
}
