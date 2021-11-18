//
//  UserModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {

    // MARK: - Private properties
    let name: String
    let token: String
    let userId: String
    let email: String

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case userId  = "id"
        case name
        case email
        case token   = "access_token"
    }

    enum GraphQLKeys: String, CodingKey, CaseIterable {
        case find    = "findUser"
        case login   = "login"
        case update  = "updateUser"
        case create  = "createUser"
        case get     = "getUsers"
        case addRole = "addRoleToUser"
    }

    // MARK: - Public properties

    // MARK: - Life cycle
    init(from decoder: Decoder) throws {
        var keyedContainer: KeyedDecodingContainer<UserModel.CodingKeys>? = nil
        
        if let graphContainer = try? decoder.container(keyedBy: GraphQLKeys.self) {
            let items = GraphQLKeys.allCases.compactMap({ key -> KeyedDecodingContainer<UserModel.CodingKeys>? in
                try? graphContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: key)
            })
            keyedContainer = items.first
        }

        guard let safeContainer = keyedContainer ?? (try? decoder.container(keyedBy: CodingKeys.self))
        else { throw GraphQlDefaultError.cantCreateDecoderContainer }

        do {
            userId = try safeContainer.decode(String.self, forKey: .userId)
            token  = try safeContainer.decode(String.self, forKey: .token)
            name   = try safeContainer.decode(String.self, forKey: .name)
            email  = try safeContainer.decode(String.self, forKey: .email)
        } catch {
            throw error
        }
    }

    // MARK: - Private methods

    // MARK: - Public methods

}
