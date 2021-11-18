//
//  DiffableTableDataSource.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

    // MARK: - DiffableTableDataSource
class DiffableTableDataSource: UITableViewDiffableDataSource<AnyHashable, AnyHashable>,
                               UITableViewDelegate,
                               UITableViewDataSourcePrefetching {

    // MARK: - Private properties
    private weak var delegate: DiffableTableDelegate?

    // MARK: - Life cycle
    init(tableView: UITableView, delegate: DiffableTableDelegate) {
        self.delegate = delegate
        super.init(tableView: tableView, cellProvider: delegate.configureCell)
    }

    // MARK: - Private methods
    private func configureSwipeAction(with viewModel: DiffableTableSwipeViewModel,
                                      at indexPath: IndexPath) -> UIContextualAction {

        let action = UIContextualAction(style: viewModel.style, title: viewModel.title) { _, _, completion in
            viewModel.handler(indexPath, completion)
        }
        action.backgroundColor = viewModel.backgroundColor
        action.image           = viewModel.image

        return action
    }

    // MARK: - Public methods
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        delegate?.configureHeader(for: tableView, in: section)
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        delegate?.prefetchData(tableView, prefetchRowsAt: indexPaths)
    }
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        delegate?.updateEditing(tableView, willBeginEditingRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        delegate?.updateHeaderHeight(tableView, at: section) ?? 0.0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        delegate?.configureFooter(for: tableView, in: section)
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll(scrollView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(at: indexPath)
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return delegate?.canEdit(tableView, at: indexPath) ?? false
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        guard let swipes = delegate?.configureSwipe(for: tableView, at: indexPath, with: .leading),
              !swipes.isEmpty
        else {
            return nil
        }

        let actions: [UIContextualAction] = swipes.map { swipe in
            configureSwipeAction(with: swipe, at: indexPath)
        }

        return UISwipeActionsConfiguration(actions: actions)
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        guard let swipes = delegate?.configureSwipe(for: tableView, at: indexPath, with: .trailing),
              !swipes.isEmpty
        else {
            return nil
        }

        let actions: [UIContextualAction] = swipes.map { swipe in
            configureSwipeAction(with: swipe, at: indexPath)
        }

        return UISwipeActionsConfiguration(actions: actions)
    }
}
