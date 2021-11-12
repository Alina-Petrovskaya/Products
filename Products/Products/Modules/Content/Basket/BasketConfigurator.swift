//
//  BasketConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - BasketConfiguratorProtocol
protocol BasketConfiguratorProtocol: AnyObject {

    func configure(orderCreationDelegate: OrderCreationDelegate?) -> BasketViewController

}

// MARK: - BasketConfigurator
class BasketConfigurator: BasketConfiguratorProtocol {

    // MARK: - Public methods
    func configure(orderCreationDelegate: OrderCreationDelegate?) -> BasketViewController {
        guard let view = BasketViewController.instantiate()
        else {
            fatalError("No BasketViewController")
        }
        let presenter  = BasketPresenter(delegate: view, orderCreationDelegate: orderCreationDelegate)
        view.presenter = presenter

        return view
    }

}
