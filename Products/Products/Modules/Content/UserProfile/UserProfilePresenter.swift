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
    func prepareTableView()
    func insertOrder(model: BasketViewModel)
}

// MARK: - UserProfilePresenter
class UserProfilePresenter: UserProfilePresenterProtocol {
    
    // MARK: - Typealiases
    typealias UserProfileViewController = UserProfilePresenterDelegate & DiffableTableUpdateProtocol

    // MARK: - Private properties
    private weak var delegate: UserProfileViewController!
    private var ordersList: [BasketViewModel] = []
    private var userModel: UserInfoViewModel?
    private var network = NetworkManager()

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: UserProfileViewController) {
        self.delegate = delegate
    }

    // MARK: - Private methods
    private func getProfileData() {
        guard let userID: String = KeychainManager().getData(for: .userID) else { return }
        let query = GetOrdersUserIdQuery(data: InputOrderId(id: userID),
                                         findUserData2: InputFindUser(id: userID, email: nil))

        network.requestData(query: query, model: ProfileModel.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.userModel = UserInfoViewModel(model: model.user,
                                                    totalOrders: model.orders.count)
                self?.ordersList = model.orders.compactMap { BasketViewModel(orderModel: $0) }
                self?.updateTableView()

            case .failure(let error):
                break
            }
        }
    }
    
    func updateTableView() {
        guard let userModel = userModel else { return }
        let userSection = DiffableTableSectionViewModel(cells: [userModel])
        let orderSection = DiffableTableSectionViewModel(cells: ordersList)
        delegate.update(with: [userSection, orderSection])
    }

    // MARK: - Public methods
    func logout() {
        KeychainManager().deleteData(for: .token)
        KeychainManager().deleteData(for: .userInfo)
    }

    func prepareTableView() {
        delegate.setup(with: UserTableViewConfigurator())
        getProfileData()
    }

    func insertOrder(model: BasketViewModel) {
        if ordersList.isEmpty {
            delegate.append(items: [model], to: 0)
        } else {
            delegate.insert(items: [model], before: ordersList[0])
            ordersList.insert(model, at: 0)
        }
    }

}
