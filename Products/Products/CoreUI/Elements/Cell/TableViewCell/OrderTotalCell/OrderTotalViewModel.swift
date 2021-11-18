//
//  OrderTotalViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import Foundation

// MARK: - OrderTotalViewModelProtocol
protocol OrderTotalViewModelProtocol {

    var total: Double { get set }

}

// MARK: - OrderTotalViewModel
class OrderTotalViewModel: OrderTotalViewModelProtocol, DiffableTableCellViewModel {

    // MARK: - Private properties

    // MARK: - Public properties
    let id: String
    var total: Double

    // MARK: Life cycle
    init(total: Double) {
        self.total = total
        self.id    = "Total ID"
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(total)
    }
    
    // MARK: - Static methods
    static func ==(lhs: OrderTotalViewModel, rhs: OrderTotalViewModel) -> Bool {
               lhs.total == rhs.total && lhs.id == rhs.id
    }

}
