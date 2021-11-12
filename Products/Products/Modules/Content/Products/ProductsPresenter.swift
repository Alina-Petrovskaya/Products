//
//  ProductsPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - ProductBuckedAddDelegate
protocol ProductBuckedAddDelegate: AnyObject {
    
    func newProductToBasket(model: ProductViewModel)
    func productDeleted(model: ProductViewModel)

}

// MARK: - ProductsPresenterDelegate
protocol ProductsPresenterDelegate: AnyObject {

    func hideProgress(with result: HudResult)

}

// MARK: - ProductsPresenterProtocol
protocol ProductsPresenterProtocol: ProductCreationDelegate {
    
    func prepareTable()

}

// MARK: - ProductsPresenter
class ProductsPresenter: ProductsPresenterProtocol {

    // MARK: - Typealiases
    typealias ProductsViewController = ProductsPresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private var network = NetworkManager()
    private weak var delegate: ProductsViewController!
    private weak var productBuckedAddDelegate: ProductBuckedAddDelegate?
    private var products: [ProductViewModel] = []

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: ProductsViewController,
                  productBuckedAddDelegate: ProductBuckedAddDelegate?) {
        self.delegate                 = delegate
        self.productBuckedAddDelegate = productBuckedAddDelegate
    }

    // MARK: - Private methods
    private func updateTable() {
        let section = DiffableTableSectionViewModel(cells: products)
        delegate?.update(with: [section])
    }

    private func getProducts() {
        guard let userID: String = KeychainManager().getData(for: .userID) else { return }
        let query = GetProductsUserIdQuery(data: InputID(id: userID))
        network.requestData(query: query,
                            model: ListModel.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.delegate.hideProgress(with: .success)
                let products: [ProductViewModel] = model.products.compactMap { product in
                    guard !product.isRemove else { return nil }
                    return ProductViewModel(model: product)
                }

                self?.products.append(contentsOf: products)
                self?.updateTable()
                
            case .failure(let error):
                self?.delegate.hideProgress(with: .error(error.localizedDescription))
            }
        }
    }

    // MARK: - Public methods
    func prepareTable() {
        let swipe = ProductSwipeConfigurator { [weak self] indexPath, isComplete in
            if let item = self?.products.remove(at: indexPath.row) {
                self?.delegate.delete(items: [item])
                self?.productBuckedAddDelegate?.productDeleted(model: item)
            }
            isComplete(true)
        }

        delegate.setup(with: ProductsTableViewConfigurator(delegate: self, swipes: [swipe]))
        updateTable()
        getProducts()
    }

}

// MARK: - ProductsTableViewCellDelegate
extension ProductsPresenter: ProductsTableViewCellDelegate {

    func byeButtonTapped(row: Int) {
        productBuckedAddDelegate?.newProductToBasket(model: products[row])
    }

    func newProductCreated(model: ProductModel) {
        let element = ProductViewModel(model: model)
        products.append(element)
        delegate.append(items: [element], to: 0)
    }

}

