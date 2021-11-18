//
//  UserProfilePresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation
import Apollo

// MARK: - UserProfilePresenterDelegate
protocol UserProfilePresenterDelegate: AnyObject {
    
    func hideProgress(with result: HudResult)
    
}

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
    private var page    = 0.0

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: UserProfileViewController) {
        self.delegate = delegate
    }

    // MARK: - Private methods
    private func requestData<M: Codable, Q: GraphQLQuery>(model: M.Type,
                                                             query: Q,
                                                             completion: @escaping (M) -> Void) {
        network.requestData(query: query, model: model) { [weak self] result in
            switch result {
            case .success(let model):
                self?.delegate.hideProgress(with: .success)
                completion(model)
                
            case .failure(let error):
                self?.delegate.hideProgress(with: .error(error.localizedDescription))
            }
        }
    }
        
    private func getProfileData() {
        guard let userID: String = KeychainManager().getData(for: .userID) else { return }
        let query = GetOrdersUserIdQuery(data: InputOrderId(id: userID),
                                         findUserData2: InputFindUser(id: userID, email: nil))
        
        requestData(model: ProfileModel.self, query: query) { [weak self] data in
            self?.userModel = UserInfoViewModel(model: data.user,
                                                totalOrders: data.orders.count)
            self?.updateTableView()
        }
    }

    private func getOrders(isStopQueryNewOrders: @escaping (Bool) -> Void) {
        guard let userID: String = KeychainManager().getData(for: .userID) else { return }
        let filter = InputFilter(skip: page, limit: 10.0)
        let query = FindOrdersQuery(data: InputOrderId(id: userID ,
                                                       filter: filter))

        requestData(model: ListModel.self, query: query) { [weak self] model in
            let orders = model.orders.compactMap { BasketViewModel(orderModel: $0) }
            self?.ordersList.append(contentsOf: orders)
            self?.page += 1
            isStopQueryNewOrders(model.orders.isEmpty || model.orders.count < 10)
            
            if self?.userModel != nil {
                self?.delegate.tableView.append(elements: orders, to: 1)
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
        delegate.setup(with: UserTableViewConfigurator(delegate: self))
        getProfileData()
        getOrders { _ in }
    }

    func insertOrder(model: BasketViewModel) {
        if ordersList.isEmpty {
            delegate.append(items: [model], to: 0)
        } else {
            ordersList.insert(model, at: 0)
            delegate.insert(items: [model], before: ordersList[1])
        }
    }
}

// MARK: - ProductsTableViewCellDelegate
extension UserProfilePresenter: UserTableViewDelegate {

    func getNewOrders(isStopQueryNewOrders: @escaping (Bool) -> Void) {
        if ordersList.isEmpty {
            isStopQueryNewOrders(false)
        } else {
            getOrders(isStopQueryNewOrders: isStopQueryNewOrders)
        }
    }

}
