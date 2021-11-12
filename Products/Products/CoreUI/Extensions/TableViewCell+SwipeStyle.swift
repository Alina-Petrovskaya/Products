//
//  TableViewCell+SwipeStyle.swift
//  Products
//
//  Created by Alina Petrovskaya on 10.11.2021.
//

import UIKit

extension UITableViewCell {
    
    var cellActionButtonLabel: UILabel? {
           superview?.subviews
               .filter { String(describing: $0).range(of: "UISwipeActionPullView") != nil }
               .flatMap { $0.subviews }
               .filter { String(describing: $0).range(of: "UISwipeActionStandardButton") != nil }
               .flatMap { $0.subviews }
               .compactMap { $0 as? UILabel }.first
       }

}
