//
//  LoginPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - LoginPresenterDelegate
protocol LoginPresenterDelegate: AnyObject { }

// MARK: - LoginPresenterProtocol
protocol LoginPresenterProtocol: AnyObject { }

// MARK: - LoginPresenter
class LoginPresenter: LoginPresenterProtocol {

    // MARK: - Private properties
    private weak var delegate: LoginPresenterDelegate!

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: LoginPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods

}
