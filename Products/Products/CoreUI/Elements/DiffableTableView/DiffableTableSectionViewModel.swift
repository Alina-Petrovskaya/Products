//
//  DiffableTableSectionViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

    // MARK: - DiffableTableCellViewModel
typealias DiffableTableCellViewModel = Hashable

    // MARK: - DiffableTableHeaderViewModel
protocol DiffableTableHeaderViewModel { }

    // MARK: - DiffableTableFooterViewModel
protocol DiffableTableFooterViewModel { }

    // MARK: - DiffableTableSectionViewModel
class DiffableTableSectionViewModel {

    // MARK: - Public properties
    var cells: [AnyHashable]
    var header: DiffableTableHeaderViewModel?
    var footer: DiffableTableFooterViewModel?
    var swipes: [DiffableTableSwipeViewModel]

    // MARK: - Life cycle
    init(cells: [AnyHashable],
         header: DiffableTableHeaderViewModel? = nil,
         footer: DiffableTableFooterViewModel? = nil,
         swipes: [DiffableTableSwipeViewModel] = []) {

        self.cells = cells
        self.header = header
        self.footer = footer
        self.swipes = swipes
    }

}
