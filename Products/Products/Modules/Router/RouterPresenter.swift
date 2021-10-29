//
//  RouterPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - RouterPresenterDelegate
protocol RouterPresenterDelegate: AnyObject {

    func presentAuth()
    func presentContent()

}

// MARK: - RouterPresenterProtocol
protocol RouterPresenterProtocol: AnyObject {

    func checkAuthState()

}

// MARK: - RouterPresenter
class RouterPresenter: RouterPresenterProtocol {

    // MARK: - Private properties
    private weak var delegate: RouterPresenterDelegate!

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: RouterPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func checkAuthState() {
    }
}
