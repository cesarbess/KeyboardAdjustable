//
//  NSObject+Extensions.swift
//  KeyboardAdjustable
//
//  Created by Cesar Bess on 24/02/19.
//

import Foundation

fileprivate var pointer: UInt8 = 0

extension NSObject {
    var userInfo: [String: Any] {
        get {
            if let userInfo = objc_getAssociatedObject(self, &pointer) as? [String: Any] {
                return userInfo
            }
            self.userInfo = [String: Any]()
            return self.userInfo
        }
        set(newValue) {
            objc_setAssociatedObject(self, &pointer, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
