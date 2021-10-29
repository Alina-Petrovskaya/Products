//
//  Constants.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - ColorConstant
enum ColorConstant: String {

    case lightBlueBackground = "LightBlueBackground"
    case darkBlueBackground  = "DarkBlueBackground"
    case darkGrayText        = "TextDarkGrey"
    case lightGray           = "TextLightGrey"
    case buttonShadow        = "ButtonShadow"
    case backgroundLightGray = "backgroundLightGray"
    case purpleText          = "PurpleText"

    func getColor() -> UIColor {
        UIColor(named: self.rawValue) ?? .clear
    }

}
