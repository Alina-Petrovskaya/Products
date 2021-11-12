//
//  TabBarViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - TabBarViewController
class TabBarViewController: UITabBarController, TabBarPresenterDelegate {

    // MARK: - IBOutlets

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: TabBarPresenterProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    // MARK: - IBActions

    // MARK: - Private methods
    private func setupTabBar() {
        selectedIndex = 0
    }

    // MARK: - Public methods

}
