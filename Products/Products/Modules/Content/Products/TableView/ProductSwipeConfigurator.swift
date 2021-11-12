//
//  ProductSwipeConfigurator.swift
//  Products
//
//  Created by Alina Petrovskaya on 10.11.2021.
//

import UIKit

// MARK: - ProductSwipeConfigurator
class ProductSwipeConfigurator: DiffableTableSwipeViewModel {

    // MARK: - Private properties
    var alignment: DiffableTableSwipeAlignment = .trailing
    var style: UIContextualAction.Style = .destructive
    var title: String? = "Delete Product"
    var backgroundColor: UIColor = .white
    var textColor: UIColor = ColorConstant.darkBlueBackground.getColor()
    var image: UIImage? = nil //UIImage(named: "DeleteButton")
    var handler: (IndexPath, @escaping (Bool) -> Void) -> Void
    
    // MARK: - Public properties
    
    // MARK: - Life cycle
    init(handler: @escaping (IndexPath, @escaping (Bool) -> Void) -> Void) {
        self.handler = handler
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
