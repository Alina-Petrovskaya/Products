//
//  ProductAddPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - ProductAddPresenterDelegate
protocol ProductAddPresenterDelegate: AnyObject { }

// MARK: - ProductAddPresenterProtocol
protocol ProductAddPresenterProtocol: AnyObject { }

// MARK: - ProductAddPresenter
class ProductAddPresenter: ProductAddPresenterProtocol {
    
    // MARK: - Typealiases
    typealias ProductAddViewController = ProductsPresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private weak var delegate: ProductAddPresenterDelegate!

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: ProductAddPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods

}
