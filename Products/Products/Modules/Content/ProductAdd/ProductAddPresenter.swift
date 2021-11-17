//
//  ProductAddPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation


// MARK: - ProductCreationDelegate
protocol ProductCreationDelegate: AnyObject {
    
    func newProductCreated(model: ProductModel)
}

// MARK: - ProductAddPresenterDelegate
/**
 Protocol to delegate from ProductAddPresenter
 */
protocol ProductAddPresenterDelegate: AnyObject {
    func hideProgress(with result: HudResult)
}

// MARK: - ProductAddPresenterProtocol
/**
 Protocol for access to methods and properties of ProductAddPresenter
 */
protocol ProductAddPresenterProtocol: AnyObject {
    func createProduct(name: String?,
                       amount: String?,
                       price: String?,
                       image: Data?,
                       productDescription: String?)
}

// MARK: - ProductAddPresenter
class ProductAddPresenter: ProductAddPresenterProtocol {
    
    // MARK: - Typealiases
    typealias ProductAddViewController = ProductsPresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private var network = NetworkManager()
    private weak var delegate: ProductAddPresenterDelegate!
    private weak var productCreationDelegate: ProductCreationDelegate?

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: ProductAddPresenterDelegate,
                  productCreationDelegate: ProductCreationDelegate?) {
        self.delegate                = delegate
        self.productCreationDelegate = productCreationDelegate
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func createProduct(name: String?,
                       amount: String?,
                       price: String?,
                       image: Data?,
                       productDescription: String?) {
        guard let price = Double(price ?? "0"),
              let amount = Double(amount ?? "0"),
              let userID: String = KeychainManager().getData(for: .userID)
        else { delegate.hideProgress(with: .error("All fields should be filled")); return }

        let productData = InputCreateProduct(price: price,
                                             title: name ?? "",
                                             content: productDescription ?? "",
                                             amount: amount,
                                             creator: userID)
        
        network.mutateData(query: CreateProductMutation(data: productData),
                           model: ProductModel.self) { [weak self] result in
            switch result {
            case .success(let product):
                self?.delegate.hideProgress(with: .success)
                self?.productCreationDelegate?.newProductCreated(model: product)

            case .failure(let error):
                self?.delegate.hideProgress(with: .error(error.localizedDescription))
            }
        }
        
        
    }
}
