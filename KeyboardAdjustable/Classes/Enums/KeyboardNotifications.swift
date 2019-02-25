//
//  KeyboardNotifications.swift
//  KeyboardAdjustable
//
//  Created by Cesar Bess on 24/02/19.
//

import Foundation

public enum KeyboardNotifications: String {
    case willShow = "willShowObserver"
    case didShow = "didShowObserver"
    case willHide = "willHideObserver"
    case didHide = "didHideObserver"
}
