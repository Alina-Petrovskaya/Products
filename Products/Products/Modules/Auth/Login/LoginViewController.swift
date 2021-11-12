//
//  LoginViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - LoginViewController
class LoginViewController: UIViewController, LoginPresenterDelegate, HudViewProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var loginButton: CustomButton!

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: LoginPresenterProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addHideKeyBoardRecognizer(for: view)
        email.delegate    = self
        password.delegate = self
    }

    // MARK: - IBActions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loginButton.isHidden = true
        showHud("Proceed...", to: view)
        presenter.login(email: email.text,
                        pass: password.text)
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hideProgress(with result: HudResult) {
        showResult(from: view, result: result)
        loginButton.isHidden = false
        switch result {
        case .error:
            break

        case .success:
            navigationController?.popToRootViewController(animated: true)
        }
    }

}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
