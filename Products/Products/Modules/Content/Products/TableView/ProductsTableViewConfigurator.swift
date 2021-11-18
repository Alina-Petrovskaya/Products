//
//  ProductsTableViewConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit

protocol ProductsTableViewCellDelegate: AnyObject {

    func byeButtonTapped(row: Int)
    func getNewProducts(isStopQueryNewProducts: @escaping (Bool) -> Void)

}

// MARK: - ProductsTableViewConfigurator
class ProductsTableViewConfigurator: DiffableTableDelegate {

    // MARK: - Private properties
    private var isLoading              = false
    private var isStopQueryNewProducts = false

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

    func updateHeaderHeight(_ tableView: UITableView, at section: Int) -> CGFloat { 1.0 }
    
    func configureSwipe(for tableView: UITableView,
                        at indexPath: IndexPath,
                        with alignment: DiffableTableSwipeAlignment) -> [DiffableTableSwipeViewModel] {
        switch alignment {
        case .leading:
            return []
        case .trailing:
            return swipes
        }
    }
    
    func canEdit(_ tableView: UITableView, at indexPath: IndexPath) -> Bool {
        true
    }

    func updateEditing(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            tableView.cellForRow(at: indexPath)?.layoutIfNeeded()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !isStopQueryNewProducts, !isLoading, let tableView = scrollView as? UITableView
        else { return }

        let tableHeight = tableView.contentSize.height
        let position    = scrollView.contentOffset.y

        if position > (tableHeight - scrollView.frame.size.height) {
            isLoading = true
            tableView.tableFooterView = FooterIndicatorView(frame: .zero)
            delegate?.getNewProducts { [weak self] isStopQueryNewProducts in
                tableView.tableFooterView    = nil
                self?.isStopQueryNewProducts = isStopQueryNewProducts
                self?.isLoading              = false
            }
        }
    }
}
