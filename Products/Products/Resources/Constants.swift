//
//  Constants.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - Color Constants
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

// MARK: - Apollo Constants
enum GraphQlConstants: String {

    case apolloUser = "iO4z3C-2j3JHEUC8BIP1eQ"
    case apolloKey  = "3f585b27-32ab-4eee-95af-7292fcc74e38"
    case url        = "https://a5node-graphql-apollo.herokuapp.com/api/graphql"

}
