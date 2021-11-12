//
//  ProductsTableViewConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit

protocol ProductsTableViewCellDelegate: AnyObject {

    func byeButtonTapped(row: Int)

}

// MARK: - ProductsTableViewConfigurator
class ProductsTableViewConfigurator: DiffableTableDelegate {

    // MARK: - Private properties

    // MARK: - Public properties
    var cells: [UITableViewCell.Type]               = [ProductCell.self]
    var headers: [UITableViewHeaderFooterView.Type] = []
    var footers: [UITableViewHeaderFooterView.Type] = []
    let swipes: [DiffableTableSwipeViewModel]
    weak var delegate: ProductsTableViewCellDelegate?

    // MARK: - Life cycle
    init(delegate: ProductsTableViewCellDelegate, swipes: [DiffableTableSwipeViewModel]) {
        self.delegate = delegate
        self.swipes   = swipes
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func configureCell(for tableView: UITableView,
                       at indexPath: IndexPath,
                       with viewModel: AnyHashable) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(ProductCell.self, for: indexPath)
        if let safeViewModel = viewModel as? ProductViewModel {
            cell?.configure(with: safeViewModel)
        }

        cell?.byeButtonTapped = { [weak self] in
            let index = tableView.indexPath(for: cell ?? UITableViewCell())
            if let row = index?.row {
                self?.delegate?.byeButtonTapped(row: row)
            }
        }
        return cell ?? UITableViewCell()
    }
    
    func configureHeader(for tableView: UITableView, in section: Int) -> UIView? {
        let view = TableHeaderView()
        view.configure(with: TableHeaderViewModel(title: "What Do You Want to Bye"))

        return view
    }

    func updateHeaderHeight(_ tableView: UITableView, at section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func configureSwipe(for tableView: UITableView,
                        at indexPath: IndexPath,
                        with alignment: DiffableTableSwipeAlignment) -> [DiffableTableSwipeViewModel] {
        swipes
    }

    func updateEditing(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            tableView.cellForRow(at: indexPath)?.layoutIfNeeded()
        }
    }
}
