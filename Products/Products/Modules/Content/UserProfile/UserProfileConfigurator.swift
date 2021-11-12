//
//  UserProfileConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import UIKit

// MARK: - UserProfileConfiguratorProtocol
protocol UserProfileConfiguratorProtocol: AnyObject {

    func configure() -> UserProfileViewController

}

// MARK: - UserProfileConfigurator
class UserProfileConfigurator: UserProfileConfiguratorProtocol {

    // MARK: - Public methods
    func configure() -> UserProfileViewController {
        guard let view = UserProfileViewController.instantiate()
        else {
            fatalError("No UserProfileViewController")
        }
        let presenter  = UserProfilePresenter(delegate: view)
        view.presenter = presenter

        return view
    }

}
