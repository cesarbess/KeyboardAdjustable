//
//  MultipleConstraintsViewController.swift
//  KeyboardAdjustable_Example
//
//  Created by Cesar Bess on 02/03/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import KeyboardAdjustable

class MultipleConstraintsViewController: UIViewController, KeyboardAdjustable {
    var keyboardAdjustingStrategy: KeyboardAdjustingStrategy?

    // MARK: Constraints

    @IBOutlet weak var appTitleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldsStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButtonTopConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Since the constraints are IBOutlets we need to compactMap them in order to make sure we're not storing an collection of optional constraints
        let constraints = [appTitleTopConstraint, textFieldsStackViewTopConstraint, loginButtonTopConstraint].compactMap({ $0 })

        keyboardAdjustingStrategy = .multipleConstraints(constraints: constraints,
                                                         originalConstants: constraints.compactMap { $0.constant },
                                                         adjustedConstants: [20, 20, 40])
        registerForKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotification()
    }
}

extension MultipleConstraintsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
