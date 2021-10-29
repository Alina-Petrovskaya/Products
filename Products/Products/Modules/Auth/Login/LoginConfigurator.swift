//
//  LoginConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - LoginConfiguratorProtocol
protocol LoginConfiguratorProtocol: AnyObject {

    func configure() -> UIViewController

}

// MARK: - LoginConfigurator
class LoginConfigurator: LoginConfiguratorProtocol {

    // MARK: - Public methods
    func configure() -> UIViewController {
        guard let view = LoginViewController.instantiate()
        else {
            fatalError("No LoginViewController")
        }
        let presenter  = LoginPresenter(delegate: view)
        view.presenter = presenter

        return view
    }

}
