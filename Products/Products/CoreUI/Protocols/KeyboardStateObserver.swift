//
//  KeyboardStateObserver.swift
//  Products
//
//  Created by Alina Petrovskaya on 10.11.2021.
//

import UIKit
import Apollo

// MARK: - KeyboardStateObserver
@objc protocol KeyboardStateObserver: AnyObject {

    var scrollView: UIScrollView! { get }

}

extension KeyboardStateObserver where Self: UIViewController {

    func setupKeyboardSubscriber() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
            guard let frameAny      = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey],
                  let keyboardFrame =  (frameAny as? NSValue)?.cgRectValue
            else { return }

            let height = keyboardFrame.size.height + 40.0
            self?.setScrollView(height)
        }

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: nil) { [weak self] _ in
            self?.setScrollView(0.0)
        }
    }

    private func setScrollView(_ height: CGFloat) {
        let inset  = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        scrollView.contentInset          = inset
        scrollView.scrollIndicatorInsets = inset
    }
}
