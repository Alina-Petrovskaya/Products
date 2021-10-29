//
//  NibLoadable.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit

protocol NibLoadable: UIView {
    
    func setupFromNib()
    
}

extension NibLoadable {

    func setupFromNib() {
        let identifier = String(describing: Self.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        guard let view = nib.instantiate(withOwner: self).first as? UIView else {
            fatalError("Error loading \(self) from nib")
        }
        
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
