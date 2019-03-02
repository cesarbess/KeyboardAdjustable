//
//  Add KeyboardAdjustingStrategy enum.swift
//  KeyboardAdjustable
//
//  Created by Cesar Bess on 24/02/19.
//

import Foundation
/**
 # KeyboardAdjustingStrategy

 An enum that constains the different strategies you can use to adjust your view for the keyboard.

 ## Strategies

 - scrollView
 - singleConstraint
*/
public enum KeyboardAdjustingStrategy {

    /**
     Sets up the scroll view to have it's offset adjusted when the keyboard appears in a way that the viewAboveKeyboard will have the desired space above the keyboard.

     - Parameter scrollView: The ScrollView which will have its offset changed
     - Parameter viewAboveKeyboard: The UIView that will move up when the keyboard appears
     - Parameter spaceAboveKeyboard: How much space in px you want your viewAboveKeyboard to have from the keyboard.
     */
    case scrollView(
        scrollView: UIScrollView,
        viewAboveKeyboard: UIView,
        spaceAboveKeyboard: CGFloat
    )

    /**
     Sets up the constraint to change its constant by the necessary amount so it keeps the desired space above the keyboard

     - Parameter constraint: The NSLayoutConstraint which will have its constant changed
     - Parameter originalConstant: The original value of the constraint so we can set the value back when the keyboard hides
     - Parameter spaceAboveKeyboard: How much space in px you want your UIView with the constraint to have from the keyboard.
     */
    case singleConstraint(
        constraint: NSLayoutConstraint,
        originalConstant: CGFloat,
        spaceAboveKeyboard: CGFloat
    )

    /**
     Sets up the collection of constraints to change its constants by the collection of constants set. Make sure all collectino parameters have the same count, otherwise extra values in the collection will have its change ignored.

     - Parameter constraints: The collection of NSLayoutConstraint which will have its constants changed
     - Parameter originalConstants: A collection of the values to be set back when the keyboard hides
     - Parameter adjustedConstants: A collection of the new values to be set in each constraint when the keyboard shows.
     */

    case multipleConstraints(
        constraints: [NSLayoutConstraint],
        originalConstants: [CGFloat],
        adjustedConstants: [CGFloat]
    )
}
