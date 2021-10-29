//
//  LoginViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - LoginViewController
class LoginViewController: UIViewController, LoginPresenterDelegate {

    // MARK: - IBOutlets

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: LoginPresenterProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureRecognizer(for: view)
    }

    // MARK: - IBActions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private methods

    // MARK: - Public methods

}
