//
//  UserTableViewConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation
import UIKit

// MARK: - UserTableViewConfigurator
class UserTableViewConfigurator: DiffableTableDelegate {

    // MARK: - Private properties
    
    // MARK: - Public properties
    var cells: [UITableViewCell.Type]               = [UserInfoCell.self, BasketCell.self]
    var headers: [UITableViewHeaderFooterView.Type] = []
    var footers: [UITableViewHeaderFooterView.Type] = []

    // MARK: - Life cycle
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    func configureCell(for tableView: UITableView, at indexPath: IndexPath, with viewModel: AnyHashable) -> UITableViewCell? {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(UserInfoCell.self, for: indexPath)
            if let safeModel = viewModel as? UserInfoViewModel {
                cell?.configure(with: safeModel)
            }
            return cell ?? UITableViewCell()
            
        default:
            let cell = tableView.dequeueReusableCell(BasketCell.self, for: indexPath)
            if let safeModel = viewModel as? BasketViewModel {
                cell?.configure(with: safeModel)
            }
            return cell ?? UITableViewCell()
        }
    }

    func configureHeader(for tableView: UITableView, in section: Int) -> UIView? {
        let view = TableHeaderView()

        switch section {
        case 0:
            view.configure(with: TableHeaderViewModel(title: "User information"))

        default:
            view.configure(with: TableHeaderViewModel(title: "Orders List"))
        }

        return view
    }
    
    func updateHeaderHeight(_ tableView: UITableView, at section: Int) -> CGFloat {
        if section == 0 {
            return UITableView.automaticDimension
        }
        return 0.0
    }

}
