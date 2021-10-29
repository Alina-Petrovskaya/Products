//
//  SignInViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - SignInViewController
class SignInViewController: UIViewController, SignInPresenterDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: SignInPresenterProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureRecognizer(for: view)
    }

    // MARK: - IBActions
    @IBAction func registerTapped(_ sender: CustomButton) {
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        navigationController?.pushViewController(LoginConfigurator().configure(), animated: true)
    }

    // MARK: - Private methods

    // MARK: - Public methods

}
