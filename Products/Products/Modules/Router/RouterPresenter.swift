//
//  RouterPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation
import Apollo

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
    private let network = NetworkManager()

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: RouterPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods
    private func findUserByID(userID: String) {
        let query = FindUserQuery(findUserData2: InputFindUser(email: nil, id: userID))
        network.requestData(query: query,
                            model: UserModel.self) { [weak self] result in
            switch result {
            case .success(let model):
                KeychainManager().save(data: model.token, for: .token)
                self?.delegate.presentContent()

            case .failure(let error):
                print(error)
                self?.delegate.presentAuth()
            }
        }
    }

    // MARK: - Public methods
    func checkAuthState() {
        guard let tolen: String = KeychainManager().getData(for: .token),
              let userID: String = KeychainManager().getData(for: .userID)
        else {
            delegate.presentAuth()
            return
        }

        findUserByID(userID: userID)
    }
}
