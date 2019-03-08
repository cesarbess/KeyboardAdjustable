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

        // Register for keyboard notifications
        registerForKeyboardNotifications()

        // Set your desired strategy to adjust the view when the keyboard appears
        self.keyboardAdjustingStrategy = .singleConstraint(constraint: bottomConstraint, originalConstant: bottomConstraint.constant, spaceAboveKeyboard: 20)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Unregister for keyboard notifications
        unregisterForKeyboardNotifications()
    }
}

extension SingleConstraintViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
