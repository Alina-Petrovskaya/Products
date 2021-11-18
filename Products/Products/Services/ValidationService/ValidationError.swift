//
//  ValidationError.swift
//  Products
//
//  Created by Alina Petrovskaya on 12.11.2021.
//

import Foundation

enum ValidationError: String, Error, LocalizedError, CustomStringConvertible {

    case shortPassword       = "Short password"
    case shortEmail          = "Short email"
    case emailBadlyFormatted = "Email Badly Formatted"
    case shortName           = "Short name"
    case shortDescription    = "Description must be longer than or equal to 10 characters"
    case shortTitle          = "Short title"

    var description: String { rawValue }
    var errorDescription: String? { description }

}
