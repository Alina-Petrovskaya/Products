//
//  Date+String.swift
//  Products
//
//  Created by Alina Petrovskaya on 12.11.2021.
//

import Foundation

extension Date {
    
    func string() -> String {
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy • HH:mm"
        return dateFormatter.string(from: self)
    }
}
