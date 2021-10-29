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
    var productID: String { get }
    var productImage: URL? { get }

}

// MARK: - BasketViewModel
class BasketViewModel: BasketViewModelProtocol, DiffableTableCellViewModel {

    // MARK: - Private properties

    // MARK: - Public properties
    var titleText: String
    var price: Double
    var productID: String
    var productImage: URL?

    // MARK: Life cycle
    init(titleText: String, price: Double, productID: String, productImage: URL?) {
        self.titleText    = titleText
        self.price        = price
        self.productID    = productID
        self.productImage = productImage
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hash(into hasher: inout Hasher) {
        hasher.combine(titleText)
        hasher.combine(price)
        hasher.combine(productID)
        hasher.combine(productImage)
    }

    // MARK: - Static methods
    static func == (lhs: BasketViewModel, rhs: BasketViewModel) -> Bool {
        lhs.titleText       == rhs.titleText
        && lhs.price        == rhs.price
        && lhs.productID    == rhs.productID
        && lhs.productImage == rhs.productImage
    }

}
