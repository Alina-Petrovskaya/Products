//
//  LoginPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - LoginPresenterDelegate
protocol LoginPresenterDelegate: AnyObject {
    
    func hideProgress(with result: HudResult)

}

// MARK: - LoginPresenterProtocol
protocol LoginPresenterProtocol: AnyObject {

    func login(email: String?, pass: String?)

}

// MARK: - LoginPresenter
class LoginPresenter: LoginPresenterProtocol {

    // MARK: - Private properties
    private weak var delegate: LoginPresenterDelegate!
    private let network = NetworkManager()

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: LoginPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func login(email: String?, pass: String?) {
        let validationResult = ValidationService().validate([
            .email(email ?? ""),
            .password(pass ?? "")])

        switch validationResult {
        case .some(let errorMessage):
            delegate.hideProgress(with: .error(errorMessage))
            
        case .none:
            let query = LoginQuery(loginData: InputLogin(email: email ?? "",
                                                         password: pass ?? ""))
            network.requestData(query: query,
                                model: UserModel.self) { [weak self] result in

                DispatchQueue.main.async {
                    switch result {
                    case .success(let model):
                        KeychainManager().save(data: model.token, for: .token)
                        KeychainManager().save(data: model.userId, for: .userID)
                        self?.delegate.hideProgress(with: .success)


                    case .failure(let error):
                        self?.delegate.hideProgress(with: .error(error.localizedDescription))
                    }
                }
            }
        }
    }

}
