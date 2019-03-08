# KeyboardAdjustable

[![Version](https://img.shields.io/cocoapods/v/KeyboardAdjustable.svg?style=flat)](https://cocoapods.org/pods/KeyboardAdjustable)
[![Platform](https://img.shields.io/cocoapods/p/KeyboardAdjustable.svg?style=flat)](https://cocoapods.org/pods/KeyboardAdjustable)

KeyboardAdjustable takes into account the three most common ways we adjust our view when the keyboard appears:

* When you have a ScrollView and you want to change its contentInset when the keyboard appears
* When you have a bottom constraint for a UIView and you want to change it’s value when the keyboard appears
* When you have multiple constraints in your views and you want to change it's values when the keyboard appears

With only one line of code you'll be able to handle these scenarios without having to implement the keyboard observers in your own UIViewController.

## How to use:

1. Import KeyboardAdjustable on your UIViewController file
2. Add the KeyboardAdjustable protocol to your UIViewController 
3. Setup a KeyboardAdjustingStrategy on your viewDidLoad

Note:
Make sure you're calling `registerForKeyboardNotifications()` on your viewDidLoad and `unregisterForKeyboardNotifications()` on your viewDidDisappear.

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
        unregisterForKeyboardNotifications()
    }
}
```

This Pod also has an example project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Demo

With a ScrollView:

![](https://media.giphy.com/media/bL8dsyyY19e9Ph0Yb5/giphy.gif)

With a Single Constraint:

![](https://media.giphy.com/media/oFyDwLDWvCK9XPCWvc/giphy.gif)

With Multiple Constraints:

![](https://media.giphy.com/media/5Y9tABBUMy9r4lP9M5/giphy.gif)


## Requirements

Swift 4.2

## Installation

KeyboardAdjustable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KeyboardAdjustable'
```

If you're having issues with the command above, try running `pod repo update` then try again

## Author

Cesar Bess, cesar.bess@gmail.com

## License

KeyboardAdjustable is available under the MIT license. See the LICENSE file for more info.
