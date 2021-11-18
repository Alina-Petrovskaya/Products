//
//  BasketTableViewConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit

// MARK: - Protocol
protocol BasketTableViewDelegate: AnyObject {
    
    func deleteButtonTapped(row: Int)
    
}

// MARK: - BasketTableViewConfigurator
class BasketTableViewConfigurator: DiffableTableDelegate {

    // MARK: - Private properties
    
    // MARK: - Public properties
    var cells: [UITableViewCell.Type] = [BasketCell.self, OrderTotalCell.self]
    var headers: [UITableViewHeaderFooterView.Type] = []
    var footers: [UITableViewHeaderFooterView.Type] = []
    weak var delegate: BasketTableViewDelegate?
    
    // MARK: - Life cycle
    init(delegate: BasketTableViewDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    func configureCell(for tableView: UITableView, at indexPath: IndexPath, with viewModel: AnyHashable) -> UITableViewCell? {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(BasketCell.self, for: indexPath)
            if let safeModel = viewModel as? BasketViewModel {
                cell?.configure(with: safeModel)
            }
            
            cell?.deleteProduct = { [weak self] in
                let index = tableView.indexPath(for: cell ?? UITableViewCell())
                if let row = index?.row {
                    self?.delegate?.deleteButtonTapped(row: row)
                }
            }
            
            return cell ?? UITableViewCell()
            
        default:
            let cell = tableView.dequeueReusableCell(OrderTotalCell.self, for: indexPath)
            if let safeModel = viewModel as? OrderTotalViewModel {
                cell?.configure(with: safeModel)
            }
            return cell ?? UITableViewCell()
        }
    }
    
    func configureHeader(for tableView: UITableView, in section: Int) -> UIView? {
        if section == 0 {
            let view = TableHeaderView()
            view.configure(with: TableHeaderViewModel(title: "Product list"))

            return view
        }
        return nil
    }
    
    func updateHeaderHeight(_ tableView: UITableView, at section: Int) -> CGFloat {
        if section == 0 {
            return 1.0
        }
        return 0.0
    }
}
