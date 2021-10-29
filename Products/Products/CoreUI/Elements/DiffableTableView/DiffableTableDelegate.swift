//
//  DiffableTableDelegate.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

    // MARK: - DiffableTableDelegate
protocol DiffableTableDelegate: AnyObject {

    var cells: [UITableViewCell.Type] { get }
    var headers: [UITableViewHeaderFooterView.Type] { get }
    var footers: [UITableViewHeaderFooterView.Type] { get }

    func configureCell(for tableView: UITableView,
                       at indexPath: IndexPath,
                       with viewModel: AnyHashable) -> UITableViewCell?

    func configureHeader(for tableView: UITableView,
                         in section: Int) -> UIView?

    func configureFooter(for tableView: UITableView,
                         in section: Int) -> UIView?

    func configureSwipe(for tableView: UITableView,
                        at indexPath: IndexPath,
                        with alignment: DiffableTableSwipeAlignment) -> [DiffableTableSwipeViewModel]

    func scrollViewDidScroll(_ scrollView: UIScrollView)

    func didSelectRow(at indexPath: IndexPath)

    func updateHeaderHeight(_ tableView: UITableView, at section: Int) -> CGFloat

}

extension DiffableTableDelegate {

    func configureHeader(for tableView: UITableView,
                         in section: Int) -> UIView? { nil }

    func configureFooter(for tableView: UITableView,
                         in section: Int) -> UIView? { nil }

    func configureSwipe(for tableView: UITableView,
                        at indexPath: IndexPath,
                        with alignment: DiffableTableSwipeAlignment) -> [DiffableTableSwipeViewModel] { [] }

    func scrollViewDidScroll(_ scrollView: UIScrollView) { }

    func didSelectRow(at indexPath: IndexPath) { }

    func updateHeaderHeight(_ tableView: UITableView, at section: Int) -> CGFloat { 0.0 }

}

