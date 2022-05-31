
extension UIView {
    @discardableResult
    public func stackUpper(_ view: UIView, options: StackOption...) -> Self {
        self.addSubview(view)
        for option in options {
            switch option {
            case .top(let value):
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: -value).isActive = true
            case .bottom(let value):
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: value).isActive = true
            case .left(let value):
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -value).isActive = true
            case .right(let value):
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: value).isActive = true
            case .centerLeft:
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                let anchor = self.leadingAnchor.constraint(equalTo: view.leadingAnchor)
                anchor.priority = .defaultLow
                anchor.isActive = true
            case .centerRight:
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                let anchor = self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                anchor.priority = .defaultLow
                anchor.isActive = true
            case .centerTop:
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                let anchor = self.topAnchor.constraint(equalTo: view.topAnchor)
                anchor.priority = .defaultLow
                anchor.isActive = true
            case .centerBottom:
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                let anchor = self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                anchor.priority = .defaultLow
                anchor.isActive = true
            case .center:
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            }
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
