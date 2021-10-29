//
//  UIViewController+KeyBoard.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

extension UIViewController {
    /**
     Add Gesture Recognizer to hide keyboard when user tap on view
     
     - parameter for view: Any element of screen that conforms to UIView.
     */
    func addGestureRecognizer<T: UIView>(for view: T) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:)))
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
