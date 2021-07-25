
import Foundation

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
    public func ref<T: NSObject>(to_ variable: inout T?) -> Self {
        variable = self as? T
        return self
    }
}

extension NSObject {
    private static var greenRoomKey: UInt32 = 893
    
    var _action: ((NSObject) -> ())? {
        get {
            return objc_getAssociatedObject(self, &Self.greenRoomKey) as? (NSObject) -> ()
        }
        set {
            objc_setAssociatedObject(self, &Self.greenRoomKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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
