//
//  SignInPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - SignInPresenterDelegate
protocol SignInPresenterDelegate: AnyObject {
    
    func hideProgress(with result: HudResult)

}

// MARK: - SignInPresenterProtocol
protocol SignInPresenterProtocol: AnyObject {

    func createUser(name: String?, login: String?, password: String?)

}

// MARK: - SignInPresenter
class SignInPresenter: SignInPresenterProtocol {

    // MARK: - Private properties
    private weak var delegate: SignInPresenterDelegate!
    private let network = NetworkManager()

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: SignInPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func createUser(name: String?, login: String?, password: String?) {
        let validationResult = AuthValidationService().validate([
            .email(login ?? ""),
            .name(name ?? ""),
            .password(password ?? "")])

        switch validationResult {
        case .some(let errorMessage):
            delegate.hideProgress(with: .error(errorMessage))
            
        case .none:
            let userData = InputCreateUser(name: name ?? "", email: login ?? "", password: password ?? "")
            network.mutateData(query: CreateUserMutationMutation(data: userData),
                               model: UserModel.self) { [weak self] result in
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
