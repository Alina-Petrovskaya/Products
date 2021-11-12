//
//  UserProfilePresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation

// MARK: - UserProfilePresenterDelegate
protocol UserProfilePresenterDelegate: AnyObject { }

// MARK: - UserProfilePresenterProtocol
protocol UserProfilePresenterProtocol: AnyObject {
    func logout()
}

// MARK: - UserProfilePresenter
class UserProfilePresenter: UserProfilePresenterProtocol {
    
    // MARK: - Typealiases
    typealias UserProfileViewController = UserProfilePresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private weak var delegate: UserProfileViewController!
    private var oredersList: [BasketViewModel] = []

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: UserProfileViewController) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func logout() {
        KeychainManager().deleteData(for: .token)
        KeychainManager().deleteData(for: .userInfo)
    }
    
    func prepareTableView() {
        delegate.setup(with: UserTableViewConfigurator())
    }
    
    func updateTableView() {
        
    }

}
