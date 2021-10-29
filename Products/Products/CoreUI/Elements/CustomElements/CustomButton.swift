//
//  CustomButton.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - CustomButton
class CustomButton: UIButton {
    
    // MARK: - Private properties
    private var shadowLayer: CAShapeLayer!
    
    // MARK: - Public properties
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setBackgroundGradient(bounds.height / 2)
        
        layer.cornerRadius = bounds.height / 2
        
        if shadowLayer == nil {
            shadowLayer      = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            
            shadowLayer.shadowColor   = ColorConstant.buttonShadow.getColor().cgColor
            shadowLayer.shadowPath    = shadowLayer.path
            shadowLayer.shadowOffset  = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.4
            shadowLayer.shadowRadius  = 22
            shadowLayer.masksToBounds = true
            shadowLayer.cornerRadius  = bounds.height / 2
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
