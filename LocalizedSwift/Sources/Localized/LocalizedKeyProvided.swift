//
//  LocalizedKeyProvided.swift
//  Localizable
//
//  Created by Mario Iannotta on 24/02/2020.
//  Copyright © 2020 Mario. All rights reserved.
//

import Foundation

/**
 A protocol that acts as abstraction layer to provide a generic object as key provider.

 By default `String` already conforms the protocol and a basic implementation for enums enums with strings as raw value is provided.
 If you want to use the latter you'll just need to make your enum conform `LocalizedKeyProvider`.

 Example:
 ```
 class ViewConroller: UIViewController {

    @Localized(MyStrings.myLabel)
    @IBOutlet private var label: UILabel!

 }

 enum MyStrings: String, LocalizedKeyProvider {
    case myLabel = "MyStrings.MyLabel"
    // ...
 }
 ```
 */
public protocol LocalizedKeyProvider {

    /**
     The localized key that will be used. By default, for strings the string itself will be used; for enums with strings as rawValue, the rawValue.
     */
    var localizedKey: String { get }
}

public extension LocalizedKeyProvider where Self: RawRepresentable, RawValue == String {
    var localizedKey: String { rawValue }
}

extension String: LocalizedKeyProvider {
    public var localizedKey: String { self }
}
