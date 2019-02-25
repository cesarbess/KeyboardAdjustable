//
//  ViewController.swift
//  AvoidKeyboard
//
//  Created by Cesar Bess on 23/02/19.
//  Copyright © 2019 Cesar Bess. All rights reserved.
//

import UIKit
import KeyboardAdjustable

class SingleConstraintViewController: UIViewController, KeyboardAdjustable {

    var keyboardAdjustingStrategy: KeyboardAdjustingStrategy?

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. Set the constraint you will want to change when the keyboard appears
        // 2. Send it's original constant so it can go back to what it was when the keyboard disappears
        // 3. Set how much space do you want your view that holds the constraint to have above the keyboard
        self.keyboardAdjustingStrategy = .singleConstraint(constraint: bottomConstraint, originalConstant: bottomConstraint.constant, spaceAboveKeyboard: 20)
        // Register for keyboard notifications
        registerForKeyboardNotifications()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Unregister for keyboard notifications
        unregisterForKeyboardNotification()
    }
}

extension SingleConstraintViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
