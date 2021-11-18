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
    
    func updateEditing(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath)
    
    func prefetchData(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath])
    
    func canEdit(_ tableView: UITableView, at indexPath: IndexPath) -> Bool

}

extension DiffableTableDelegate {

    func configureHeader(for tableView: UITableView,
                         in section: Int) -> UIView? { nil }

    func configureFooter(for tableView: UITableView,
                         in section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    func configureSwipe(for tableView: UITableView,
                        at indexPath: IndexPath,
                        with alignment: DiffableTableSwipeAlignment) -> [DiffableTableSwipeViewModel] { [] }

    func scrollViewDidScroll(_ scrollView: UIScrollView) { }

    func didSelectRow(at indexPath: IndexPath) { }

    func updateHeaderHeight(_ tableView: UITableView, at section: Int) -> CGFloat { 0.0 }
    
    func updateEditing(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) { }
    
    func prefetchData(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) { }
    
    func canEdit(_ tableView: UITableView, at indexPath: IndexPath) -> Bool { false }

}

