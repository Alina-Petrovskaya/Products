//
//  ProductAddConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - ProductAddConfiguratorProtocol
protocol ProductAddConfiguratorProtocol: AnyObject {

    func configure() -> UIViewController

}

// MARK: - ProductAddConfigurator
class ProductAddConfigurator: ProductAddConfiguratorProtocol {

    // MARK: - Public methods
    func configure() -> UIViewController {
        guard let view = ProductAddViewController.instantiate()
        else {
            fatalError("No ProductAddViewController")
        }
        let presenter  = ProductAddPresenter(delegate: view)
        view.presenter = presenter

        return view
    }

}
