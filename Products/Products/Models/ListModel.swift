//
//  ListModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 11.11.2021.
//

import Foundation

// MARK: - ListModel
struct ListModel: Codable {
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case products  = "getProductsUserId"
        case orders    = "getOrders"
    }

    // MARK: - Public properties
    var products: [ProductModel] = []
    var orders: [OrderModel]     = []
    
    // MARK: - Life cycle
    init(from decoder: Decoder) throws {
        guard let safeContainer = try? decoder.container(keyedBy: CodingKeys.self)
        else { throw GraphQlDefaultError.cantCreateDecoderContainer }

        products = (try? safeContainer.decode([ProductModel].self, forKey: .products)) ?? []
        orders   = (try? safeContainer.decode([OrderModel].self, forKey: .orders)) ?? []
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
