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
 A model to associate a key provider to a `UIControl.State`.
 */
public struct LocalizedConfiguration<KeyProvider: LocalizedKeyProvider> {
    let state: UIControl.State
    let keyProvider: KeyProvider

    private init(state: UIControl.State, keyProvider: KeyProvider) {
        self.state = state
        self.keyProvider = keyProvider
    }

    /**
     A syntactic sugar shortcut to create a `LocalizedConfiguration`.
     - Parameters:
        - keyProvider: The localized key provider.
        - state: The associated state.
     */
    public static func key(_ keyProvider: KeyProvider, for state: UIControl.State) -> LocalizedConfiguration<KeyProvider> {
        LocalizedConfiguration(state: state, keyProvider: keyProvider)
    }
}

extension UIButton: Localizable {
    
    var localizedState: UIControl.State {
        state
    }
    
    public func setLocalizedString(_ string: String, for state: UIControl.State) {
        setTitle(string, for: state)
    }
}

extension UILabel: Localizable {
    
    public func setLocalizedString(_ string: String, for state: UIControl.State) {
        text = string
    }
}

extension UITextField: Localizable {
    
    public func setLocalizedString(_ string: String, for state: UIControl.State) {
        placeholder = string
    }
}

extension UIImageView: Localizable {
    
    public func setLocalizedString(_ string: String, for state: UIControl.State) {
        image = UIImage(named: string)
    }
}
