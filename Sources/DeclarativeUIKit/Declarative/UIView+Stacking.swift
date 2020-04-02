//
//  UIView+Stacking.swift
//
//  Created by Brian Voong on 4/28/19.
// 
//

import UIKit

public class SpaceView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initAppearence()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initAppearence()
    }
    open func initAppearence() {
        backgroundColor = .clear
    }
}

public protocol StackableViewDeclarative: DeclarativeStyle {}

@available(iOS 11.0, *)
extension StackableViewDeclarative where Self: UIView {
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.fillSuperviewSafeAreaLayoutGuide()
        return stackView
    }
    //MARK: Declarative programing
    @discardableResult
    public func vstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.vertical, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    public func hstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    /// Make your whole view is a scroll view
    /// - Parameter views: List of view with calculable height
    @discardableResult
    public func vscroll(_ views: UIView...) -> UIScrollView {
        let scrollView = UIScrollView()
        self.addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        let stV = UIStackView(arrangedSubviews: views)
        scrollView.addSubview(stV)
        stV.axis = .vertical
        stV.fillSuperview()
        
        stV.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        return scrollView
    }
}

@available(iOS 9.0, *)
extension StackableViewDeclarative where Self: UIStackView {
    @discardableResult
    public func with(margins: UIEdgeInsets) -> Self {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    public func pad(left: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = left
        return self
    }
    
    @discardableResult
    public func pad(top: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = top
        return self
    }
    
    @discardableResult
    public func pad(bottom: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = bottom
        return self
    }
    
    @discardableResult
    public func pad(right: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = right
        return self
    }
}

@available(iOS 11.0, *)
extension StackableViewDeclarative where Self: UIViewController {
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, to view: UIView) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        view.addSubview(stackView)
        stackView.fillSuperviewSafeAreaLayoutGuide()
        return stackView
    }
    
    
    //MARK: Declarative programing
    @discardableResult
    public func vstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.vertical, views: views, spacing: spacing, alignment: alignment, distribution: distribution, to: self.view)
    }
    
    @discardableResult
    public func hstack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution, to: self.view)
    }
    
    /// Make your whole view is a scroll view
    /// - Parameter views: List of view with calculable height
    @discardableResult
    public func vscroll(_ views: UIView...) -> UIScrollView {
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.fillSuperviewSafeAreaLayoutGuide()
        scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        let stV = UIStackView(arrangedSubviews: views)
        scrollView.addSubview(stV)
        stV.axis = .vertical
        stV.fillSuperview()
        
        stV.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        return scrollView
    }
}

extension CGSize {
    static public func equalEdge(_ edge: CGFloat) -> CGSize {
        return .init(width: edge, height: edge)
    }
}

extension UIEdgeInsets {
    static public func allSides(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}
