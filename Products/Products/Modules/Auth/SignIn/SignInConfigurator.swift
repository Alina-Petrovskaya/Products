//
//  SignInConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - SignInConfiguratorProtocol
protocol SignInConfiguratorProtocol: AnyObject {

    func configure() -> UIViewController

}

// MARK: - SignInConfigurator
class SignInConfigurator: SignInConfiguratorProtocol {

    // MARK: - Public methods
    func configure() -> UIViewController {
        guard let view = SignInViewController.instantiate()
        else {
            fatalError("No SignInViewController")
        }
        let presenter  = SignInPresenter(delegate: view)
        view.presenter = presenter

        return view
    }

}
