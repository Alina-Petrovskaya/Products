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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.checkAuthState()
    }

    // MARK: - IBActions

    // MARK: - Private methods
    private func setup() {
        navigationController?.navigationBar.isHidden = true
        view.setBackgroundGradient(isAnimate: true)
    }

    // MARK: - Public methods
    func presentAuth() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(SignInConfigurator().configure(),
                                                     animated: true)
        }
    }

    func presentContent() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(TabBarConfigurator().configure(),
                                                     animated: true)
        }
    }

}
