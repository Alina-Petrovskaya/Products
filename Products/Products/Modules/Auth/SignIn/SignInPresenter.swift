//
//  SignInPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - SignInPresenterDelegate
protocol SignInPresenterDelegate: AnyObject { }

// MARK: - SignInPresenterProtocol
protocol SignInPresenterProtocol: AnyObject { }

// MARK: - SignInPresenter
class SignInPresenter: SignInPresenterProtocol {

    // MARK: - Private properties
    private weak var delegate: SignInPresenterDelegate!

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: SignInPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods

}
