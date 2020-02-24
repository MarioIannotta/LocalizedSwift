//
//  Localizable.swift
//  Localizable
//
//  Created by Mario Iannotta on 20/02/2020.
//  Copyright © 2020 Mario. All rights reserved.
//

import Foundation

/**
 A property wrapper to localize UI Components in a simple and declarative way.
 It is possible to localize custom components making the component conform the protocol `Localizable`.
 */
@propertyWrapper
public struct Localized<Item: Localizable, KeyProvider: LocalizedKeyProvider> {

    private let configurations: [LocalizedConfiguration<KeyProvider>]
    private let bundle: Bundle
    private let stringsFileName: String?

    public var wrappedValue: Item? {
        didSet {
            guard
                let wrappedValue = wrappedValue
                else { return }
            configurations.forEach {
                let string = NSLocalizedString($0.keyProvider.localizedKey, tableName: stringsFileName, bundle: bundle, comment: "")
                wrappedValue.setLocalizedString(string, for: $0.state)
            }
        }
    }

    /**
    Create a new localized component.
    - Parameters:
       - configurations: A list of configurations where it is possible to declare a keyProvider for each `UIControl.State`.
       - stringsFileName: The `.strings` file name. If none is provided the keyProvider will be fetched from `Localizable.string`.
       - bundle: The bundle that include  the localized `.strings` file. The default is `.main`.

     Example:
     ```
     @Localized(.key("Button.Title", for: .normal),
                .key("Button.Highlighted.Title", for: .highlighted))
     @IBOutlet private var secondButton: UIButton!
     ```
    */
    public init(_ configurations: LocalizedConfiguration<KeyProvider>..., stringsFileName: String? = nil, bundle: Bundle = .main) {
        self.configurations = configurations
        self.bundle = bundle
        self.stringsFileName = stringsFileName
    }

    /**
     Create a new localized component.
     - Parameters:
        - keyProvider: The key provider of the localized strings.
        - stringsFileName: The `.strings` file name. If none is provided the key will be fetched from `Localizable.string`.
        - bundle: The bundle that include  the localized `.strings` file. The default is `.main`.

     Example:
     ```
     @Localized("Label.Title", stringsFileName: "AStringsFile", bundle: .aBundle)
     @IBOutlet private var label: UILabel!
     ```
     */
    public init(_ key: KeyProvider, stringsFileName: String? = nil, bundle: Bundle = .main) {
        self.init(.key(key, for: .normal), stringsFileName: stringsFileName, bundle: bundle)
    }
}
