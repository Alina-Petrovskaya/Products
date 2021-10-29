//
//  ProductsPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - ProductsPresenterDelegate
protocol ProductsPresenterDelegate: AnyObject {
    
    
}

// MARK: - ProductsPresenterProtocol
protocol ProductsPresenterProtocol: AnyObject {
    
    func prepareTable()

}

// MARK: - ProductsPresenter
class ProductsPresenter: ProductsPresenterProtocol {

    // MARK: - Typealiases
    typealias ProductsViewController = ProductsPresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private weak var delegate: ProductsViewController!

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: ProductsViewController) {
        self.delegate = delegate
    }

    // MARK: - Private methods
    
    private func prepareContent() {
        let cells = [
            ProductViewModel(title: "1", price: "5.99", image: nil),
            ProductViewModel(title: "2", price: "5.99", image: nil),
            ProductViewModel(title: "3", price: "5.99", image: nil),
            ProductViewModel(title: "4", price: "5.99", image: nil),
        ]
        let section = DiffableTableSectionViewModel(cells: cells)
        delegate?.update(with: [section])
    }

    // MARK: - Public methods
    func addProduct() {
    }

    func prepareTable() {
        delegate.setup(with: ProductsTableViewConfigurator(delegate: self))
        prepareContent()
        
    }

}

// MARK: - ProductsTableViewCellDelegate
extension ProductsPresenter: ProductsTableViewCellDelegate {

    func byeButtonTapped(row: Int) { }

}
