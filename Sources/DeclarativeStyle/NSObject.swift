
import Foundation
import UIKit

extension NSObject {
    /// Make the variable reference to the object, often using in declarative ui coding
    ///
    /// ```
    /// var viewRef: UIView!
    /// UIView().ref(to: &viewRef)
    /// ```
    /// same as
    /// ```
    /// var viewRef: UIView! = UIView()
    /// ```
    @discardableResult
    public func ref<T: NSObject>(to variable: inout T?) -> Self {
        variable = self as? T
        return self
    }
    
    ///Append this object to exist array
    @discardableResult
    public func append<T: NSObject>(to list: inout Array<T>) -> Self {
        if let instance = self as? T {
            list.append(instance)
        } else {
            #if DEBUG
            fatalError("Could not append to list")
            #endif
        }
        return self
    }
}

extension NSObject {
    private static var uniqueKey: String = UUID().uuidString
    
    var _action: ((NSObject) -> ())? {
        get {
            return objc_getAssociatedObject(self, &Self.uniqueKey) as? (NSObject) -> ()
        }
        set {
            objc_setAssociatedObject(self, &Self.uniqueKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func action_Objc(sender: NSObject) {
        _action?(self)
    }
    func stopAppWhen1EventIsAlreadyRegister() {
        guard _action == nil
        else {
            fatalError("Only 1 event is allowed to register when using declarative style")
        }
    }
}

extension UIView {
    @discardableResult
    public func setVal<T>(_ kp: ReferenceWritableKeyPath<UIView, T>, value: T) -> Self {
        self[keyPath: kp] = value
        return self
    }
}
