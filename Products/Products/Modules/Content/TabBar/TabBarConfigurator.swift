//
//  TabBarConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - TabBarConfiguratorProtocol
protocol TabBarConfiguratorProtocol: AnyObject {

    func configure() -> UITabBarController

}

// MARK: - TabBarConfigurator
class TabBarConfigurator: TabBarConfiguratorProtocol {
    
    // MARK: - Private methods
    private func configureItems() -> [UIViewController] {
        let userVC = UserProfileConfigurator().configure()
        userVC.tabBarItem = UITabBarItem(title: "",
                                         image: UIImage(systemName: "person"),
                                         selectedImage: UIImage(systemName: "person.fill"))
        
        let basketVC = BasketConfigurator().configure(orderCreationDelegate: userVC)
        basketVC.tabBarItem = UITabBarItem(title: "",
                                           image: UIImage(systemName: "cart"),
                                           selectedImage: UIImage(systemName: "cart.fill"))

        let productsVC = ProductsConfigurator().configure(productBuckedAddDelegate: basketVC)
        productsVC.tabBarItem = UITabBarItem(title: "",
                                             image: UIImage(systemName: "bag"),
                                             selectedImage: UIImage(systemName: "bag.fill"))

        return [productsVC, basketVC, userVC]
    }

    // MARK: - Public methods
    func configure() -> UITabBarController {
        guard let view = TabBarViewController.instantiate()
        else {
            fatalError("No TabBarViewController")
        }
        let presenter         = TabBarPresenter(delegate: view)
        view.presenter        = presenter
        view.viewControllers  = configureItems()
        view.tabBar.tintColor = ColorConstant.purpleText.getColor()
        
        return view
    }

}
