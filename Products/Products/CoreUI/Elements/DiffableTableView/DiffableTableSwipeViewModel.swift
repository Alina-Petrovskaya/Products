//
//  DiffableTableSwipeViewModel.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

    // MARK: - DiffableTableSwipeAlignment
enum DiffableTableSwipeAlignment {

    case leading
    case trailing

}

    // MARK: - DiffableTableSwipeViewModel
protocol DiffableTableSwipeViewModel {

    var alignment: DiffableTableSwipeAlignment { get }
    var style: UIContextualAction.Style { get }
    var title: String? { get }
    var backgroundColor: UIColor { get }
    var image: UIImage? { get }
    var handler: (IndexPath, @escaping (Bool) -> Void) -> Void { get }

}
