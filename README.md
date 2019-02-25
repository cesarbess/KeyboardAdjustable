# KeyboardAdjustable

[![CI Status]()](https://travis-ci.org/CesarBess/KeyboardAdjustable)
[![Version](https://img.shields.io/cocoapods/v/KeyboardAdjustable.svg?style=flat)](https://cocoapods.org/pods/KeyboardAdjustable)
[![License](https://img.shields.io/cocoapods/l/Keyhttps://img.shields.io/travis/CesarBess/KeyboardAdjustable.svg?style=flatboardAdjustable.svg?style=flat)](https://cocoapods.org/pods/KeyboardAdjustable)
[![Platform](https://img.shields.io/cocoapods/p/KeyboardAdjustable.svg?style=flat)](https://cocoapods.org/pods/KeyboardAdjustable)

KeyboardAdjustable takes into account the two most common ways we adjust our view when the keyboard appears:

* When you have a ScrollView and you want to change its contentInset when the keyboard appears
* When you have a bottom constraint for a UIView and you want to change it’s value when the keyboard appears

With only one line of code you'll be able to handle these scenarios without having to implement the observers in your own UIViewController.

## How to use:

1. Import KeyboardAdjustable on your UIViewController file
2. Add the KeyboardAdjustable protocol to your UIViewController 
3. Setup a KeyboardAdjustingStrategy on your viewDidLoad

Note:
Make sure you're calling `registerForKeyboardNotifications()` on your viewDidLoad and `unregisterForKeyboardNotification()` on your viewDidDisappear.

## Example

```
class SingleConstraintViewController: UIViewController, KeyboardAdjustable {

    var keyboardAdjustingStrategy: KeyboardAdjustingStrategy?

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register for keyboard notifications
        registerForKeyboardNotifications()
        
        // Set your desired strategy to adjust the view when the keyboard appears
        self.keyboardAdjustingStrategy = .singleConstraint(
                                          constraint: bottomConstraint, 
                                          originalConstant: bottomConstraint.constant,
                                          spaceAboveKeyboard: 20)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Unregister for keyboard notifications
        unregisterForKeyboardNotification()
    }
}
```

This Pod also has an example project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 4.2

## Installation

KeyboardAdjustable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KeyboardAdjustable'
```

## Author

Cesar Bess, cesar.bess@gmail.com

## License

KeyboardAdjustable is available under the MIT license. See the LICENSE file for more info.
