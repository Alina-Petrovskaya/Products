//
//  ProfileModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 12.11.2021.
//

import Foundation

// MARK: - ProfileModel
struct ProfileModel: Codable {

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case user   = "findUser"
        case orders = "getOrdersUserId"
    }

    // MARK: - Public properties
    let orders: [OrderModel]
    let user: UserModel
    
    // MARK: - Life cycle
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
