//
//  TableView+DequeueCell.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<Cell: UITableViewCell>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell? {
        let identifier = String(describing: type)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell
    }

    func dequeueReusableHeaderFooterView<HeaderFooter: UIView>(_ type: HeaderFooter.Type) -> HeaderFooter? {
        let identifier = String(describing: type)
        return dequeueReusableHeaderFooterView(withIdentifier: identifier) as? HeaderFooter
    }

}


