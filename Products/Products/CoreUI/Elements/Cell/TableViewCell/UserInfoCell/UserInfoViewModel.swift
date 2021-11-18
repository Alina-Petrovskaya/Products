//
//  UserInfoViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation

// MARK: - UserInfoViewModelProtocol
protocol UserInfoViewModelProtocol {

    var userName: String { get }
    var email: String { get }
    var totalOrders: Int { get }

}

// MARK: - UserInfoViewModel
class UserInfoViewModel: UserInfoViewModelProtocol, DiffableTableCellViewModel {

    // MARK: - Private properties
    var userName: String
    var email: String
    var totalOrders: Int

    // MARK: - Public properties

    // MARK: Life cycle
    init(model: UserModel, totalOrders: Int) {
        self.userName    = model.name
        self.email      = model.email
        self.totalOrders = totalOrders
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hash(into hasher: inout Hasher) {
        hasher.combine(userName)
        hasher.combine(email)
        hasher.combine(totalOrders)
    }

    // MARK: - Static methods
    static func == (lhs: UserInfoViewModel, rhs: UserInfoViewModel) -> Bool {
        lhs.userName       == rhs.userName
        && lhs.email      == rhs.email
        && lhs.totalOrders == rhs.totalOrders
    }

}
