//
//  UserProfileViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import UIKit

// MARK: - UserProfileViewController
class UserProfileViewController: UIViewController, UserProfilePresenterDelegate, DiffableTableUpdateProtocol, HudViewProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: DiffableTableView!

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: UserProfilePresenterProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showHud("Loading...", to: view)
        presenter.prepareTableView()
    }

    // MARK: - IBActions
    @IBAction func logoutTapped(_ sender: CustomButton) {
        presenter.logout()
        navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func hideProgress(with result: HudResult) {
        showResult(from: view, result: result)
    }
}

// MARK: - OrderCreationDelegate
extension UserProfileViewController: OrderCreationDelegate {

    func newOrderCreated(model: BasketViewModel) {
        guard tableView != nil else { return }
        presenter.insertOrder(model: model)
    }

}
