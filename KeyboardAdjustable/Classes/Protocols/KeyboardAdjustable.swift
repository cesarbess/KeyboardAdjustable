//
//  KeyboardAdjustable.swift
//  KeyboardAdjustable
//
//  Created by Cesar Bess on 24/02/19.
//

import Foundation
import UIKit

/**
 The protocol that contains the logic to adjust the view when the keyboard appears and hides
 */
public protocol KeyboardAdjustable {
    var keyboardAdjustingStrategy: KeyboardAdjustingStrategy? { get set }
}

extension KeyboardAdjustable where Self: UIViewController {

    /**
     The user's default NotificationCenter
     */
    public var center: NotificationCenter {
        get {
            return NotificationCenter.default
        }
    }

    private var safeAreaTopInset: CGFloat {
        get {
            if #available(iOS 11.0, *) {
                return view.safeAreaInsets.top
            } else {
                return 0
            }
        }
    }

    func keyboardWillShow(notification: Notification) {
        guard let strategy = keyboardAdjustingStrategy else {
            fatalError("Need to set a KeyboardAdjustingStrategy")
        }

        switch strategy {
        case .scrollView(let scrollView, let viewAboveKeyboard, let distanceAboveKeyboard):
            adjustKeyboardWillShow(on: scrollView, view: viewAboveKeyboard, with: distanceAboveKeyboard, for: notification)
        case .singleConstraint(let constraint, _, let distanceAboveKeyboard):
            adjustKeyboardWillShow(on: constraint, with: distanceAboveKeyboard, for: notification)
        }
    }

    func keyboardWillHide(notification: Notification) {
        guard let strategy = keyboardAdjustingStrategy else {
            fatalError("Need to set a KeyboardAdjustingStrategy")
        }

        switch strategy {
        case .scrollView(let scrollView, _, _):
            adjustKeyboardWillHide(on: scrollView)
        case .singleConstraint(let constraint, let normalConstant, _):
            adjustKeyboardWillHide(on: constraint, with: normalConstant, for: notification)
        }
    }

    // MARK: Notifications Setup

    /**
     Registers the ViewController to two keyboard notifications:
     - keyboardWillShowNotification,
     - keyboardWillHideNotification

     Make sure to implement your KeyboardAdjustingStrategy before one of these notifications are triggered.
     */
    public func registerForKeyboardNotifications() {
        userInfo[KeyboardNotifications.willShow.rawValue] = center.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: keyboardWillShow)

        userInfo[KeyboardNotifications.willHide.rawValue] = center.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: keyboardWillHide)
    }

    /**
     Unregisters the ViewController from two keyboard notifications:
     - keyboardWillShowNotification,
     - keyboardWillHideNotification

     Make sure to call this on your viewDidDisappear, or whenever you don't want to listen to keyboard changes anymore
     */
    public func unregisterForKeyboardNotification() {
        if let willShowObserver = userInfo[KeyboardNotifications.willShow.rawValue] as? NSObjectProtocol {
            center.removeObserver(willShowObserver, name: UIResponder.keyboardWillShowNotification, object: nil)
        }

        if let willHideObserver = userInfo[KeyboardNotifications.willHide.rawValue] as? NSObjectProtocol {
            center.removeObserver(willHideObserver, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }

    // MARK: Keyboard Will Show Handlers

    func adjustKeyboardWillShow(on scrollView: UIScrollView, view aboveKeyboard: UIView, with distanceAboveKeyboard: CGFloat, for notification: Notification) {

        guard let keyboardSize = notification.keyboardSize else { return }
        
        var contentInset: UIEdgeInsets = scrollView.contentInset
        let spaceFromBottom = view.frame.maxY - aboveKeyboard.frame.maxY
        let inset = keyboardSize.height - spaceFromBottom + distanceAboveKeyboard + safeAreaTopInset

        contentInset.bottom = inset
        scrollView.contentInset = contentInset

        guard
            let keyboardAnimationDuration = notification.keyboardAnimationDuration,
            let animationCurve = notification.keyboardAnimationCurve
        else { return }

        let curveAnimationOption = UIView.AnimationOptions(rawValue: UInt(animationCurve))
        let options: UIView.AnimationOptions = [.beginFromCurrentState, curveAnimationOption]

        UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: options, animations: {
            scrollView.scrollToBottom()
        })
    }

    func adjustKeyboardWillShow(on singleConstraint: NSLayoutConstraint, with constant: CGFloat, for notification: Notification) {
        guard
            let keyboardSize = notification.keyboardSize,
            let keyboardAnimationDuration = notification.keyboardAnimationDuration,
            let animationCurve = notification.keyboardAnimationCurve
        else { return }

        let bottomConstraintConstant = keyboardSize.height + constant
        let curveAnimationOption = UIView.AnimationOptions(rawValue: UInt(animationCurve))
        let options: UIView.AnimationOptions = [.beginFromCurrentState, curveAnimationOption]

        singleConstraint.constant = bottomConstraintConstant
        UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: options, animations: {
            [weak self] in
            self?.view.layoutIfNeeded()
        })
    }

    // MARK: Keyboard Will Hide Handlers

    func adjustKeyboardWillHide(on scrollView: UIScrollView) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }

    func adjustKeyboardWillHide(on singleConstraint: NSLayoutConstraint, with constant: CGFloat, for notification: Notification) {
        guard
            let keyboardAnimationDuration = notification.keyboardAnimationDuration,
            let animationCurve = notification.keyboardAnimationCurve
        else { return }

        let curveAnimationOption = UIView.AnimationOptions(rawValue: UInt(animationCurve))
        let options: UIView.AnimationOptions = [.beginFromCurrentState, curveAnimationOption]

        singleConstraint.constant = constant
        UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: options, animations: {
            [weak self] in
            self?.view.layoutIfNeeded()
        })
    }
}
