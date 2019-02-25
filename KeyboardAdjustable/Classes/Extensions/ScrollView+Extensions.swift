//
//  ScrollView+Extensions.swift
//  KeyboardAdjustable
//
//  Created by Cesar Bess on 24/02/19.
//

import UIKit

public extension UIScrollView {

    public func scrollToBottom(animated: Bool = false) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        setContentOffset(bottomOffset, animated: animated)
    }
}
