//
//  ProductViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import Foundation

// MARK: - ProductViewModelProtocol
protocol ProductViewModelProtocol {
    var title: String { get }
    var price: String { get }
    var image: URL? { get }
}

// MARK: - ProductViewModel
class ProductViewModel: ProductViewModelProtocol, DiffableTableCellViewModel {

    // MARK: - Private properties

    // MARK: - Public properties
    var title: String
    var price: String
    var image: URL?

    // MARK: Life cycle
    init(title: String, price: String, image: URL?) {
        self.title = title
        self.price = price
        self.image = image
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(price)
        hasher.combine(image)
    }

    // MARK: - Static methods
    static func == (lhs: ProductViewModel, rhs: ProductViewModel) -> Bool {
        lhs.title  == rhs.title
        && lhs.price  == rhs.price
        && lhs.image  == rhs.image
    }

}
