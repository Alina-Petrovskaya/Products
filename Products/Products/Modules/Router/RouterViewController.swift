//
//  RouterViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - RouterViewController
class RouterViewController: UIViewController, RouterPresenterDelegate {

    // MARK: - IBOutlets

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: RouterPresenterProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.checkAuthState()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // presentAuth()
       presentContent()
    }

    // MARK: - IBActions

    // MARK: - Private methods
    private func setup() {
        navigationController?.navigationBar.isHidden = true
        view.setBackgroundGradient(isAnimate: true)
    }

    // MARK: - Public methods
    func presentAuth() {
        navigationController?.pushViewController(SignInConfigurator().configure(),
                                                 animated: true)
    }

    func presentContent() {
        navigationController?.pushViewController(TabBarConfigurator().configure(),
                                                 animated: true)
    }

}
