//
//  SignInViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - SignInViewController
class SignInViewController: UIViewController, SignInPresenterDelegate, HudViewProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var registerButton: CustomButton!

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: SignInPresenterProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addHideKeyBoardRecognizer(for: view)
        password.delegate = self
        email.delegate    = self
        name.delegate     = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    // MARK: - IBActions
    @IBAction func registerTapped(_ sender: CustomButton) {
        registerButton.isHidden = true
        showHud("Creating...", to: view)
        presenter.createUser(name: name.text,
                             login: email.text,
                             password: password.text)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        navigationController?.pushViewController(LoginConfigurator().configure(), animated: true)
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hideProgress(with result: HudResult) {
        showResult(from: view, result: result)
        registerButton.isHidden = false
        switch result {
        case .error:
            break

        case .success:
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

// MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
