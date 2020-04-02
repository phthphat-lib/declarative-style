//
//  File.swift
//  
//
//  Created by Lucas Pham on 3/28/20.
//

import Foundation

public protocol DeclarativeStyle {}

extension DeclarativeStyle {
    @discardableResult
    public func assignTo(_ variable: inout Self) -> Self {
        variable = self
        return self
    }
    
    @discardableResult
    public func withSetUp(_ setUp: (Self) -> Void) -> Self {
        setUp(self)
        return self
    }
}
