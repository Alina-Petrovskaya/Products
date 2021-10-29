//
//  BasketConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - BasketConfiguratorProtocol
protocol BasketConfiguratorProtocol: AnyObject {

    func configure() -> UIViewController

}

// MARK: - BasketConfigurator
class BasketConfigurator: BasketConfiguratorProtocol {

    // MARK: - Public methods
    func configure() -> UIViewController {
        guard let view = BasketViewController.instantiate()
        else {
            fatalError("No BasketViewController")
        }
        let presenter  = BasketPresenter(delegate: view)
        view.presenter = presenter

        return view
    }

}
