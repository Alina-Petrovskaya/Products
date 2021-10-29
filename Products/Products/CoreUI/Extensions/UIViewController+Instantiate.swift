//
//  UIViewController+Instantiate.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

extension UIViewController {

    /**
     Create object of UIViewController
     - returns: UIViewController object
     
     # Notes: #
     1. To make it work UIViewController should have the same names at:
     - UIViewController name
     - Storyboard file name
     - Storyboard ID
     */
    static func instantiate() -> Self? {
        let vcName = String(describing: self)
        let storyBoard = UIStoryboard(name: vcName, bundle: .main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: vcName)
        
        return viewController as? Self
    }

}
