//
//  ProductModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable {

    // MARK: - Static properties
    
    // MARK: - Private properties

    // MARK: - Public properties
    let productID: String
    let name: String
    let price: Double
    let isRemove: Bool
    let amount: Int
    let description: String

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case productID   = "_id"
        case name        = "title"
        case price       = "price"
        case isRemove    = "isRemove"
        case amount      = "amount"
        case description = "content"
    }

    enum GraphQLKeys: String, CodingKey, CaseIterable {
        case create   = "createProduct"
        case find     = "findProduct"
        case update   = "updateProduct"
        case products = "getProductsUserId"
    }

    // MARK: - Public properties

    // MARK: - Life cycle
    init(from decoder: Decoder) throws {
        var keyedContainer: KeyedDecodingContainer<ProductModel.CodingKeys>? = nil
        
        if let graphContainer = try? decoder.container(keyedBy: GraphQLKeys.self) {
            let items = GraphQLKeys.allCases.compactMap({ key -> KeyedDecodingContainer<ProductModel.CodingKeys>? in
                   return try? graphContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: key)
            })
            keyedContainer = items.first
        }

        guard let safeContainer = keyedContainer ?? (try? decoder.container(keyedBy: CodingKeys.self))
        else { throw GraphQlDefaultError.cantCreateDecoderContainer }
        
        do {
            productID   = try safeContainer.decode(String.self, forKey: .productID)
            name        = try safeContainer.decode(String.self, forKey: .name)
            price       = try safeContainer.decode(Double.self, forKey: .price)
            isRemove    = try safeContainer.decode(Bool.self, forKey: .isRemove)
            amount      = try safeContainer.decode(Int.self, forKey: .amount)
            description = try safeContainer.decode(String.self, forKey: .description)
        } catch {
            throw error
        }
    }
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
