//
//  HudViewProtocol.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation

import UIKit
import MBProgressHUD

// MARK: - HudResult
enum HudResult {
    case error(String)
    case success
}

// MARK: - HudViewProtocol
protocol HudViewProtocol: AnyObject {

    func showHud(_ message: String, to view: UIView)
    func dismissHud(from view: UIView)
    func showResult(from view: UIView, result: HudResult)

}

extension HudViewProtocol {

    func showHud(_ message: String, to view: UIView) {
        DispatchQueue.main.async {
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.label.text = message
            hud.label.numberOfLines = 5
            hud.bezelView.style = .blur
            hud.bezelView.color = .clear
            hud.bezelView.layer.cornerRadius = 5
            hud.isUserInteractionEnabled = false
            hud.layer.zPosition = 2
        }
    }
    
    func showResult(from view: UIView, result: HudResult) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: view, animated: true)
            let hud = MBProgressHUD.showAdded(to: view, animated: false)
            hud.mode = .customView
            
            var animationDuratin = 1.0
            
            switch result {
            case .error(let message):
                hud.customView = UIImageView(image: UIImage(systemName: "xmark"))
                hud.label.text = message
                hud.label.numberOfLines = 5
                animationDuratin = 3
                
            case .success:
                hud.customView = UIImageView(image: UIImage(systemName: "checkmark"))
            }
            
            hud.bezelView.layer.cornerRadius = 5
            hud.isUserInteractionEnabled = false
            hud.layer.zPosition = 2
            
            hud.hide(animated: true, afterDelay: animationDuratin)
        }
    }

    func dismissHud(from view: UIView) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
}

