//
//  RouterConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - RouterConfiguratorProtocol
protocol RouterConfiguratorProtocol: AnyObject {

    func configure() -> UIViewController

}

// MARK: - RouterConfigurator
class RouterConfigurator: RouterConfiguratorProtocol {

    // MARK: - Public methods
    func configure() -> UIViewController {
        guard let view = RouterViewController.instantiate()
        else {
            fatalError("No RouterViewController")
        }
        let presenter  = RouterPresenter(delegate: view)
        view.presenter = presenter

        return view
    }

}
