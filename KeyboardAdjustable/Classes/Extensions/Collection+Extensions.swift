//
//  Collection+Extensions.swift
//  KeyboardAdjustable
//
//  Created by Cesar Bess on 02/03/19.
//

import Foundation

public extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
