//
//  Localizable.swift
//  Localizable
//
//  Created by Mario Iannotta on 20/02/2020.
//  Copyright © 2020 Mario. All rights reserved.
//

import UIKit

/**
 A protocol that allow to localize components using the property wrapper `@Localized`.
 `UILabel`, `UIButton` and `UITextField` already conform this protocol.
 */
public protocol Localizable {

    /**
     Set the provided localized string for a provided state.
     - Parameters:
        - string: the localized string.
        - state: the state for which the string should be set.
     */
    func setLocalizedString(_ string: String, for state: UIControl.State)

}

/**
 A model to associate a key to a `UIControl.State`.
 */
public struct LocalizedConfiguration {
    let state: UIControl.State
    let key: String

    private init(state: UIControl.State, key: String) {
        self.state = state
        self.key = key
    }

    /**
     A syntactic sugar shortcut to create a `LocalizedConfiguration`.
     - Parameters:
        - key: The localized key.
        - state: The associated state.
     */
    public static func key(_ key: String, for state: UIControl.State) -> LocalizedConfiguration {
        LocalizedConfiguration(state: state, key: key)
    }
}

/**
 A property wrapper to localize UI Components in a simple and declarative way.
 It is possible to localize custom components making the component conform the protocol `Localizable`.

 */
@propertyWrapper
public struct Localized<Item: Localizable> {

    private let configurations: [LocalizedConfiguration]
    private let bundle: Bundle
    private let stringsFileName: String?

    public var wrappedValue: Item? {
        didSet {
            guard
                let wrappedValue = wrappedValue
                else { return }
            configurations.forEach {
                let string = NSLocalizedString($0.key, tableName: stringsFileName, bundle: bundle, comment: "")
                wrappedValue.setLocalizedString(string, for: $0.state)
            }
        }
    }

    /**
    Create a new localized component.
    - Parameters:
       - configurations: A list of configurations where it is possible to declare a key for each `UIControl.State`.
       - stringsFileName: The `.strings` file name. If none is provided the key will be fetched from `Localizable.string`.
       - bundle: The bundle that include  the localized `.strings` file. The default is `.main`.

     Example:
     ```
     @Localized(.key("Button.Title", for: .normal),
                .key("Button.Highlighted.Title", for: .highlighted))
     @IBOutlet private var secondButton: UIButton!
     ```
    */
    public init(_ configurations: LocalizedConfiguration..., stringsFileName: String? = nil, bundle: Bundle = .main) {
        self.configurations = configurations
        self.bundle = bundle
        self.stringsFileName = stringsFileName
    }

    /**
     Create a new localized component.
     - Parameters:
        - key: The key of the localized strings.
        - stringsFileName: The `.strings` file name. If none is provided the key will be fetched from `Localizable.string`.
        - bundle: The bundle that include  the localized `.strings` file. The default is `.main`.

     Example:
     ```
     @Localized("Label.Title", stringsFileName: "AStringsFile", bundle: .aBundle)
     @IBOutlet private var label: UILabel!
     ```
     */
    public init(_ key: String, stringsFileName: String? = nil, bundle: Bundle = .main) {
        self.init(.key(key, for: .normal), stringsFileName: stringsFileName, bundle: bundle)
    }
}
