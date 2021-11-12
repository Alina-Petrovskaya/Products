//
//  BasketViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import Foundation

// MARK: - BasketViewModelProtocol
protocol BasketViewModelProtocol {
    
    var titleText: String { get }
    var price: Double { get }
    var elementID: String { get }
    var productImage: URL? { get }
    var isHideDeleteButton: Bool { get }
    var subtitle: String { get }

}

// MARK: - BasketViewModel
class BasketViewModel: BasketViewModelProtocol, DiffableTableCellViewModel {

    // MARK: - Private properties

    // MARK: - Public properties
    var titleText: String
    var price: Double
    var elementID: String
    var productImage: URL?
    var isHideDeleteButton: Bool
    var subtitle: String

    // MARK: Life cycle
    /**
     Init for product cell
     */
    init(productModel: ProductViewModel) {
        self.titleText          = productModel.title
        self.price              = productModel.price
        self.elementID          = productModel.productID
        self.subtitle           = "ID: \(productModel.productID)"
        self.productImage       = productModel.image
        self.isHideDeleteButton = false
    }
    
    /**
     Init for order cell
     */
    init(orderModel: OrderModel) {
        self.titleText          = "\(orderModel.date)"
        self.price              = orderModel.totalSum
        self.elementID          = orderModel.orderID
        self.subtitle           = "Created: \(orderModel.date.string())"
        self.productImage       = nil
        self.isHideDeleteButton = true
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hash(into hasher: inout Hasher) {
        hasher.combine(titleText)
        hasher.combine(price)
        hasher.combine(elementID)
        hasher.combine(productImage)
    }

    // MARK: - Static methods
    static func == (lhs: BasketViewModel, rhs: BasketViewModel) -> Bool {
        lhs.titleText       == rhs.titleText
        && lhs.price        == rhs.price
        && lhs.elementID    == rhs.elementID
        && lhs.productImage == rhs.productImage
    }

}
