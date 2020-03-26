<p align="center">
<img src="https://raw.githubusercontent.com/MarioIannotta/LocalizedSwift/master/LocalizedSwift.jpg" alt="Localizable: Localize UI Components in a simple and declarative way" height="170"/>
</p>

# Installation
[![Version](https://img.shields.io/cocoapods/v/LocalizedSwift.svg?style=flat)](https://cocoapods.org/pods/LocalizedSwift)
[![License](https://img.shields.io/cocoapods/l/LocalizedSwift.svg?style=flat)](https://cocoapods.org/pods/LocalizedSwift)
[![Platform](https://img.shields.io/cocoapods/p/LocalizedSwift.svg?style=flat)](https://cocoapods.org/pods/LocalizedSwift)

### Pods
> pod 'LocalizedSwift'

## Swift package manager
> From Xcode, select File → Swift Packages → Add Package Dependency → Select your project → Search **LocalizedSwift**

# Usage

It is possible to localize a class that conforms `Localizable`  adding `@Localized("YouKey")` before the component declaration.
`UILabel`, `UIButton`, `UITextField` and `UIImageView` already conform `Localizable`.
```swift
// In the following example the string for the key "Label.Title" will be searched in the file "Localizable.strings".
@Localized("Label.Title")
@IBOutlet private var label: UILabel!
```

If the strings are defined in a file different from `Localizable.strings` set the parameter `stringsFileName` with the name of the file.
```swift
// In the following example the string for the key "Label.Title" will be searched in the file "AFile.strings".
@Localized("Label.Title", stringsFileName: "AFile") 
@IBOutlet private var label: UILabel!
```

If the `.strings` file is in a bundle other than `.main` set the parameter `bundle` with the bundle where the file is embedded.
```swift
// In the following example the string for the key "Label.Title" will be searched in the file "AFile.strings" in the bundle `.anotherBundle`.
@Localized("Label.Title", stringsFileName: "AFile", bundle: .anotherBundle) 
@IBOutlet private var label: UILabel!
```

### Set strings for state

It is possible to set different localized strings for different `UIControl.State` using the declaration `@Localized(.key(, for:), .key(, for:) ..., stringsFileName:, bundle:)`.

The method `.key(:, for: )` is a factory method to instantiate the object that associate a key to a state  `LocalizedConfiguration`.
```swift
// In the following example the string for the key "Button.Title" will be set for the normal state and the string for the key "Button.Highlighted.Title" will be set for the highlighted state.
@Localized(.key("Button.Title", for: .normal),
           .key("Button.Highlighted.Title", for: .highlighted))
@IBOutlet private var button: UIButton!
```

It is possible to set `stringsFileName` and `bundle` just like in the examples above.

# Info
Made with ❤️ and ☕️ by [@MarioIannotta](http://www.twitter.com/marioiannotta)
