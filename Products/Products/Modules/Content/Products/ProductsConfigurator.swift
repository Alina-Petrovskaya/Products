//
//  ProductsConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - ProductsConfiguratorProtocol
protocol ProductsConfiguratorProtocol: AnyObject {

    func configure(productBuckedAddDelegate: ProductBuckedAddDelegate?) -> UIViewController

}

// MARK: - ProductsConfigurator
class ProductsConfigurator: ProductsConfiguratorProtocol {

    // MARK: - Public methods
    func configure(productBuckedAddDelegate: ProductBuckedAddDelegate?) -> UIViewController {
        guard let view = ProductsViewController.instantiate()
        else {
            fatalError("No ProductsViewController")
        }
        let presenter  = ProductsPresenter(delegate: view, productBuckedAddDelegate: productBuckedAddDelegate)
        view.presenter = presenter

        return view
    }

}
