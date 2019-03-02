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
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register for keyboard notifications
        registerForKeyboardNotifications()

        // Set your desired strategy to adjust the view when the keyboard appears
        keyboardAdjustingStrategy = .scrollView(scrollView: scrollView, viewAboveKeyboard: loginButton, spaceAboveKeyboard: 20)
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
