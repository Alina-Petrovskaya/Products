//
//  ProductViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import Foundation

// MARK: - ProductViewModelProtocol
protocol ProductViewModelProtocol {
    var productID: String { get }
    var title: String { get }
    var price: Double { get }
    var image: URL? { get }
}

// MARK: - ProductViewModel
class ProductViewModel: ProductViewModelProtocol, DiffableTableCellViewModel {

    // MARK: - Private properties
    private var model: ProductModel

    // MARK: - Public properties
    var productID: String
    var title: String
    var price: Double
    var image: URL?

    // MARK: Life cycle
    init(model: ProductModel) {
        self.productID = model.productID
        self.title = model.name
        self.price = model.price
        self.image = nil
        self.model = model
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(price)
        hasher.combine(image)
    }
    
    func getRemoveModel(isRemove: Bool) {
    }

    // MARK: - Static methods
    static func == (lhs: ProductViewModel, rhs: ProductViewModel) -> Bool {
        lhs.title  == rhs.title
        && lhs.price  == rhs.price
        && lhs.image  == rhs.image
    }

}
