//
//  GraphQlErrorInner.swift
//  Products
//
//  Created by Alina Petrovskaya on 09.11.2021.
//

import Foundation
import Apollo

// MARK: - GraphQlDefaultError
enum GraphQlDefaultError: String, Error {
    
    case noUserToken                = "Unable to get user token"
    case needToRefresh              = "Need to refresh"
    case nilUrl                     = "Unable to get url"
    case cantGetJsonObjectFromData  = "Unable to get Json Object"
    case cantCreateDecoderContainer = "Unable to create Decoder Container"
    case cantCreateNestedContainer  = "Unable to create Nested Container"
    case userNotFound               = "User not found"
    case validationError            = "Validation Error. Please check your"
    case userAlreadyExist           = "User with email already exists"

}

// MARK: - GraphQlCustomError
struct GraphQlCustomError: Error, CustomStringConvertible, LocalizedError {
    
    // MARK: - Private properties
    let message: String
    let errorCode: String
    let description: String
    var errorDescription: String? {
        if errorCode == "401" {
            return "The safe session has expired. Please login again"
        } else {
            return description
        }
    }

    // MARK: - Public properties

    // MARK: - Life cycle
    init(graphQlError: GraphQLError) {
        message     = (graphQlError["messages"] as? String) ?? "Ooops... Something wrong"
        errorCode   = (graphQlError["status"] as? String) ?? ""
        
        var descriptionMessage = message
        let path = (graphQlError["path"] as? [String]) ?? []
        if !path.isEmpty {
            let pathString = path.joined(separator: ", ")
            descriptionMessage = pathString + ": " + descriptionMessage
        }

        description = descriptionMessage
    }
    
    init(message: [String]) {
        self.message = message.joined(separator: ", ")
        errorCode = ""
        description = self.message
    }
    
    init(_ error: GraphQlDefaultError) {
        message     = error.rawValue
        errorCode   = ""
        description = message
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
