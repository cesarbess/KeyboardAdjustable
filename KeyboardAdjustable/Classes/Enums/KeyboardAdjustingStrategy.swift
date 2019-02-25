//
//  Add KeyboardAdjustingStrategy enum.swift
//  KeyboardAdjustable
//
//  Created by Cesar Bess on 24/02/19.
//

import Foundation

public enum KeyboardAdjustingStrategy {

    case scrollView(
        scrollView: UIScrollView,
        viewAboveKeyboard: UIView,
        spaceAboveKeyboard: CGFloat
    )

    case singleConstraint(
        constraint: NSLayoutConstraint,
        originalConstant: CGFloat,
        spaceAboveKeyboard: CGFloat
    )
}
