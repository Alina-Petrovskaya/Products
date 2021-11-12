//
//  UIView+Gradient.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

extension UIView {

    func setBackgroundGradient(_ cornerRadius: CGFloat = 0, opacity: Float = 1, isAnimate: Bool = false) {
        let gradientLayer = CAGradientLayer()
        let colorFrom = ColorConstant.lightBlueBackground.getColor().cgColor
        let colorTo = ColorConstant.darkBlueBackground.getColor().cgColor
        
        gradientLayer.startPoint = .init(x: 0.3, y: 0.5)
        gradientLayer.endPoint   = .init(x: 1, y: 0.5)
        
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.colors = [colorFrom, colorTo]
        gradientLayer.frame        = bounds
        gradientLayer.opacity      = opacity
        gradientLayer.cornerRadius = cornerRadius
        if isAnimate {
            animateGradient(from: colorFrom, to: colorTo, animatelayer: gradientLayer)
        } else {
            layer.insertSublayer(gradientLayer, at:0)
        }
    }
    
    private func animateGradient(from: CGColor, to: CGColor, animatelayer: CAGradientLayer) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.fromValue    = [from, to]
        animation.toValue      = [to, from]
        animation.duration     = 5.0
        animation.autoreverses = true
        animation.repeatCount  = Float.infinity
        animation.fillMode     = .backwards
        animatelayer.add(animation, forKey: nil)
        layer.insertSublayer(animatelayer, at:0)
    }
}
