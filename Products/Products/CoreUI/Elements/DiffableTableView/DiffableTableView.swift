//
//  DiffableTableView.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

    // MARK: - DiffableTableSnapshot
typealias DiffableTableSnapshot = NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable>

    // MARK: - DiffableTableView
class DiffableTableView: UITableView {

    // MARK: - Private properties
    private var diffableDataSource: DiffableTableDataSource!

    // MARK: - Private methods
    private func registerCells(_ cells: [UITableViewCell.Type]) {
        for cell in cells {
            let identifier = String(describing: cell)
            let nib = UINib(nibName: identifier, bundle: .main)
            register(nib, forCellReuseIdentifier: identifier)
        }
    }

    private func registerHeaderFooterViews(_ views: [UITableViewHeaderFooterView.Type]) {
        for view in views {
            let identifier = String(describing: view)
            let nib = UINib(nibName: identifier, bundle: .main)
            register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }

    // MARK: - Public methods
    func setup(with diffableDelegate: DiffableTableDelegate) {
        registerCells(diffableDelegate.cells)
        registerHeaderFooterViews(diffableDelegate.headers)
        registerHeaderFooterViews(diffableDelegate.footers)

        diffableDataSource = DiffableTableDataSource(tableView: self, delegate: diffableDelegate)

        dataSource = diffableDataSource
        delegate = diffableDataSource
    }

    func update(with sections: [DiffableTableSectionViewModel], _ animation: UITableView.RowAnimation = .automatic) {
        var snapshot = DiffableTableSnapshot()

        for (index, section) in sections.enumerated() {
            snapshot.appendSections([index])
            snapshot.appendItems(section.cells, toSection: index)
        }
        diffableDataSource.defaultRowAnimation = animation

        DispatchQueue.main.async { [weak self] in
            self?.diffableDataSource.apply(snapshot, animatingDifferences: true)
        }
    }

    func insert(elements: [AnyHashable], before element: AnyHashable) {
        var snapshot = diffableDataSource.snapshot()
        snapshot.insertItems(elements, beforeItem: element)
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }

    func append(elements: [AnyHashable], to section: Int) {
        var snapshot = diffableDataSource.snapshot()
        snapshot.appendItems(elements, toSection: section)
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }

    func reload(items: [AnyHashable]) {
        var snapshot = diffableDataSource.snapshot()
        snapshot.reloadItems(items)
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }

    func delete(items: [AnyHashable]) {
        var snapshot = diffableDataSource.snapshot()
        snapshot.deleteItems(items)
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }

}

