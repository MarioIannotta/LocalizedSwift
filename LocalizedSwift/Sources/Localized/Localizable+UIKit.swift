//
//  Localizable+UIKit.swift
//  Localizable
//
//  Created by Mario Iannotta on 20/02/2020.
//  Copyright © 2020 Mario. All rights reserved.
//

import UIKit

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
