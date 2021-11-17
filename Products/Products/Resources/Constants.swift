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
    case apolloKey  = "service:iO4z3C-2j3JHEUC8BIP1eQ:6P3sWMSR0N51rx6RzH9fPg"
    case url        = "https://a5node-graphql-apollo.herokuapp.com/api/graphql"

}
