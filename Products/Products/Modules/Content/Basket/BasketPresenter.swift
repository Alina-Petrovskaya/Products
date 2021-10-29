//
//  BasketPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - BasketPresenterDelegate
protocol BasketPresenterDelegate: AnyObject { }

// MARK: - BasketPresenterProtocol
protocol BasketPresenterProtocol: AnyObject {

    func prepareTable()

}

// MARK: - BasketPresenter
class BasketPresenter: BasketPresenterProtocol {

    // MARK: - Typealiases
    typealias ProductAdViewController = BasketPresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private weak var delegate: ProductAdViewController!

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: ProductAdViewController) {
        self.delegate = delegate
    }

    // MARK: - Private methods
    private func prepareContent() {
        let products = [
            BasketViewModel(titleText: "One", price: 1.1, productID: "sdasd", productImage: nil),
            BasketViewModel(titleText: "Two", price: 1.1, productID: "sdd", productImage: nil)
        ]
        let prodSection = DiffableTableSectionViewModel(cells: products)

        let total = OrderTotalViewModel(total: 2.2)
        let totalSection = DiffableTableSectionViewModel(cells: [total])
        
        delegate?.update(with: [prodSection, totalSection])
    }

    // MARK: - Public methods
    func prepareTable() {
        delegate.setup(with: BasketTableViewConfigurator(delegate: self))
        prepareContent()
    }

}

// MARK: - BasketTableViewDelegate
extension BasketPresenter: BasketTableViewDelegate {
    func deleteButtonTapped(row: Int) {
        // delete product
        // calculate total sum
    }
}
