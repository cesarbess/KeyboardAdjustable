//
//  ScrollViewKeyboardViewController.swift
//  AvoidKeyboard
//
//  Created by Cesar Bess on 23/02/19.
//  Copyright © 2019 Cesar Bess. All rights reserved.
//

import UIKit
import KeyboardAdjustable

class ScrollViewKeyboardViewController: UIViewController, KeyboardAdjustable {

    var keyboardAdjustingStrategy: KeyboardAdjustingStrategy?

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var textFieldsStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. Send the scroll view which will have its offset changed
        // 2. Send the view that will get hidden by the keyboard
        // 3. Set the space you want the view to have above the keyboard
        keyboardAdjustingStrategy = .scrollView(scrollView: scrollView, viewAboveKeyboard: textFieldsStackView, spaceAboveKeyboard: 20)
        // Register for keyboard notifications
        registerForKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        // Unregister for keyboard notifications
        unregisterForKeyboardNotification()
    }
}

extension ScrollViewKeyboardViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
