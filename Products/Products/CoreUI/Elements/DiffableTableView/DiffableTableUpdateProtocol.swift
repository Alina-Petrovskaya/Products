//
//  DiffableTableUpdateProtocol.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

protocol DiffableTableUpdateProtocol {

    var tableView: DiffableTableView! { get }

    func setup(with diffableDelegate: DiffableTableDelegate)
    func update(with sections: [DiffableTableSectionViewModel])
    func insert(items: [AnyHashable], before item: AnyHashable)
    func reload(items: [AnyHashable])

}

extension DiffableTableUpdateProtocol {

    func setup(with diffableDelegate: DiffableTableDelegate) {
        tableView.setup(with: diffableDelegate)
    }

    func update(with sections: [DiffableTableSectionViewModel]) {
        tableView.update(with: sections, .fade)
    }

    func append(items: [AnyHashable], to section: Int) {
        tableView.tableFooterView = nil
        tableView.append(elements: items, to: section)
    }

    func reload(items: [AnyHashable]) {
        tableView.reload(items: items)
    }

    func insert(items: [AnyHashable], before item: AnyHashable) {
        tableView.insert(elements: items, before: item)
    }

    func delete(items: [AnyHashable]) {
        tableView.delete(items: items)
    }

}

