//
//  UserProfileViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import UIKit

// MARK: - UserProfileViewController
class UserProfileViewController: UIViewController, UserProfilePresenterDelegate, DiffableTableUpdateProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: DiffableTableView!

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: UserProfilePresenterProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    @IBAction func logiutTapped(_ sender: CustomButton) {
        presenter.logout()
        navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Private methods

    // MARK: - Public methods

}

// MARK: - OrderCreationDelegate
extension UserProfileViewController: OrderCreationDelegate {

    func newOrderCreated(model: BasketViewModel) {
        
    }
    
}
