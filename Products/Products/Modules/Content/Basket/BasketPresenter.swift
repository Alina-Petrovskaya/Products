//
//  BasketPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - BasketPresenterDelegate
protocol BasketPresenterDelegate: AnyObject {
 
    func isHiddenProducts(_ isHiddenTable: Bool)
    func hideProgress(with result: HudResult)
    func updateNumberOfItems(_ number: Int)
    
}

// MARK: - BasketPresenterProtocol
protocol BasketPresenterProtocol: AnyObject {

    func prepareTable()
    func prepareTableContent()
    func buyButtonTapped()
    func addNewProduct(model: ProductViewModel)
    func deleteProduct(model: ProductViewModel)

}

// MARK: - OrderCreationDelegate
protocol OrderCreationDelegate: AnyObject {

    func newOrderCreated(model: BasketViewModel)
    
}

// MARK: - BasketPresenter
class BasketPresenter: BasketPresenterProtocol {

    // MARK: - Typealiases
    typealias ProductAdViewController = BasketPresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private weak var delegate: ProductAdViewController!
    private weak var orderCreationDelegate: OrderCreationDelegate?
    private let network = NetworkManager()
    private var products: [BasketViewModel] = []

    private var totalViewModel: OrderTotalViewModel = OrderTotalViewModel(total: 0.0)

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: ProductAdViewController,
                  orderCreationDelegate: OrderCreationDelegate?) {
        self.delegate              = delegate
        self.orderCreationDelegate = orderCreationDelegate
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func prepareTable() {
        delegate?.isHiddenProducts(products.isEmpty)
        delegate.setup(with: BasketTableViewConfigurator(delegate: self))
    }

    func prepareTableContent() {
        delegate?.isHiddenProducts(products.isEmpty)
        delegate.updateNumberOfItems(products.count)
        let prodSection      = DiffableTableSectionViewModel(cells: products)
        totalViewModel = OrderTotalViewModel(total: products.reduce(0) { $0 + $1.price })
        let totalSection     = DiffableTableSectionViewModel(cells: [totalViewModel])

        delegate?.update(with: [prodSection, totalSection])
    }

    func addNewProduct(model: ProductViewModel) {
        if let index = products.firstIndex(where: { $0.elementID == model.productID }) {
        } else {
            products.append(BasketViewModel(productModel: model))
            delegate.updateNumberOfItems(products.count)
        }
    }

    func deleteProduct(model: ProductViewModel) {
        guard let index = products.firstIndex(where: { $0.elementID == model.productID })
        else { return }
        deleteButtonTapped(row: index)
    }

    func buyButtonTapped() {
        guard let userID: String = KeychainManager().getData(for: .userID)
        else { return }
        let products: [String] = products.map { $0.elementID }
        let query = CreateOrderMutation(data: InputCreateOrder(customer: userID,
                                                               price: totalViewModel.total,
                                                               products: products))
        network.mutateData(query: query, model: OrderModel.self) { [weak self] result in
            switch result {
            case .success(let orderModel):
                self?.products.removeAll()
                self?.prepareTableContent()
                self?.delegate.hideProgress(with: .success)
                let model = BasketViewModel(orderModel: orderModel)
                self?.orderCreationDelegate?.newOrderCreated(model: model)

            case .failure(let error):
                self?.delegate.hideProgress(with: .error(error.localizedDescription))
            }
        }
    }
}

// MARK: - BasketTableViewDelegate
extension BasketPresenter: BasketTableViewDelegate {
    func deleteButtonTapped(row: Int) {
        let item = products.remove(at: row)
        delegate?.delete(items: [item])
        totalViewModel.total = products.reduce(0) { $0 + $1.price }
        delegate?.reload(items: [totalViewModel])
        delegate?.isHiddenProducts(products.isEmpty)
        delegate.updateNumberOfItems(products.count)
    }
}
