//
//  UIViewEventExtension.swift
//
//  Created by Phat Pham on 11/06/2021.
//

import UIKit


public extension UIView {
    @discardableResult
    func onTapGesture(_ onTap: @escaping (UITapGestureRecognizer) -> Void) -> Self {
        stopAppWhen1EventIsAlreadyRegister()
        _action = { ges in
            onTap(ges as! UITapGestureRecognizer)
        }
        self.isUserInteractionEnabled = true
        let ges = UITapGestureRecognizer(target: self, action: #selector(onTapGesture_Objc(ges:)))
        self.addGestureRecognizer(ges)
        return self
    }
    @objc private func onTapGesture_Objc(ges: UITapGestureRecognizer) {
        _action?(ges)
    }
}

public extension UIButton {
    @discardableResult
    func onEvent(_ event: UIControl.Event = .primaryActionTriggered, _ handle: @escaping (UIButton) -> Void) -> Self {
        stopAppWhen1EventIsAlreadyRegister()
        self._action = { btn in
            handle(btn as! UIButton)
        }
        self.addTarget(self, action: #selector(action_Objc(sender:)), for: event)
        return self
    }
}

public extension UITextField {
    @discardableResult
    func onEvent(_ event: UIControl.Event = .primaryActionTriggered, _ handle: @escaping (UITextField) -> Void) -> Self {
        stopAppWhen1EventIsAlreadyRegister()
        self._action = { tf in
            handle(tf as! UITextField)
        }
        self.addTarget(self, action: #selector(action_Objc(sender:)), for: .editingChanged)
        return self
    }
}


public extension UIRefreshControl {
    @discardableResult
    func onEvent(_ event: UIControl.Event = .primaryActionTriggered, _ handle: @escaping (UIRefreshControl) -> Void) -> Self {
        stopAppWhen1EventIsAlreadyRegister()
        self._action = { refreshCtrl in
            handle(refreshCtrl as! UIRefreshControl)
        }
        self.addTarget(self, action: #selector(action_Objc(sender:)), for: event)
        return self
    }
}


//Pull to refresh
extension UITableView {
    @available(iOS 10.0, *)
    @discardableResult
    func setPullToRefresh(_ onRefresh: @escaping (_ handler: @escaping () -> Void) -> Void) -> Self {
        let refreshControl = UIRefreshControl()
        refreshControl.onEvent { [weak refreshControl] _ in
            onRefresh { [weak refreshControl] in
                refreshControl?.endRefreshing()
            }
        }
        self.refreshControl = refreshControl
        return self
    }
}
