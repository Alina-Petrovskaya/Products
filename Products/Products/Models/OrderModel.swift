//
//  OrderModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation

// MARK: - OrderModel
struct OrderModel: Codable {

    // MARK: - Private properties

    // MARK: - Public properties
    let orderID: String
    let date: Date
    let products: [ProductModel]
    let totalSum: Double

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case orderID  = "_id"
        case date     = "create_at"
        case totalSum = "price"
        case products
    }

    enum GraphQLKeys: String, CodingKey, CaseIterable {
        case get      = "getOrders"
        case find     = "findOrder"
        case fromUser = "getOrdersUserId"
        case update   = "updateOrder"
        case create   = "createOrder"
    }

    // MARK: - Life cycle
    init(from decoder: Decoder) throws {
        var keyedContainer: KeyedDecodingContainer<OrderModel.CodingKeys>? = nil

        if let graphContainer = try? decoder.container(keyedBy: GraphQLKeys.self) {
            let items = GraphQLKeys.allCases.compactMap({ key -> KeyedDecodingContainer<OrderModel.CodingKeys>? in
                try? graphContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: key)
            })
            keyedContainer = items.first
        }
        
        guard let safeContainer = keyedContainer ?? (try? decoder.container(keyedBy: CodingKeys.self))
        else { throw GraphQlDefaultError.cantCreateDecoderContainer }
       
        products = (try? safeContainer.decode([ProductModel].self, forKey: .products)) ?? []

        do {
            orderID  = try safeContainer.decode(String.self, forKey: .orderID)
            let timeInterval = try safeContainer.decode(String.self, forKey: .date)
            date = Date(timeIntervalSince1970: (Double(timeInterval) ?? 0.0) / 1000)
            totalSum = try safeContainer.decode(Double.self, forKey: .totalSum)
        } catch {
            throw error
        }
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
