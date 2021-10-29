//
//  TableHeaderViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import Foundation

// MARK: - TableHeaderViewModelProtocol
protocol TableHeaderViewModelProtocol {
    
    var title: String { get }
    
}

// MARK: - TableHeaderViewModel
class TableHeaderViewModel: TableHeaderViewModelProtocol, DiffableTableHeaderViewModel {
    
    // MARK: - Private properties
    
    // MARK: - Public properties
    var title: String
    
    // MARK: Life cycle
    init(title: String) {
        self.title = title
    }
    
    // MARK: - Private methods
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    // MARK: - Static methods
    static func == (lhs: TableHeaderViewModel, rhs: TableHeaderViewModel) -> Bool {
               lhs.title  == rhs.title
    }
}
