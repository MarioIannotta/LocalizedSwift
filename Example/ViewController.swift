//
//  ViewController.swift
//  Localizable Demo
//
//  Created by Mario Iannotta on 21/02/2020.
//  Copyright © 2020 Mario. All rights reserved.
//

import UIKit
import Localized

class ViewController: UIViewController {

    @Localized("Label.Title")
    @IBOutlet private var label: UILabel!

    @Localized(.key("Button.Title", for: .normal),
               .key("Button.Selected.Title", for: .selected), stringsFileName: "AnotherFile")
    @IBOutlet private var firstButton: UIButton!

    @Localized(.key("Button.Title", for: .normal),
               .key("Button.Highlighted.Title", for: .highlighted), stringsFileName: "AnotherFile")
    @IBOutlet private var secondButton: UIButton!

    @IBAction private func secondButtonDidTap() {
        firstButton.isSelected = !firstButton.isSelected
    }

}
