//
//  ProductsConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - ProductsConfiguratorProtocol
protocol ProductsConfiguratorProtocol: AnyObject {

    func configure() -> UIViewController

}

// MARK: - ProductsConfigurator
class ProductsConfigurator: ProductsConfiguratorProtocol {

    // MARK: - Public methods
    func configure() -> UIViewController {
        guard let view = ProductsViewController.instantiate()
        else {
            fatalError("No ProductsViewController")
        }
        let presenter  = ProductsPresenter(delegate: view)
        view.presenter = presenter

        return view
    }

}
