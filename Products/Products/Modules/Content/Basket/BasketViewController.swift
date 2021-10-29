//
//  BasketViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - BasketViewController
class BasketViewController: UIViewController, BasketPresenterDelegate, DiffableTableUpdateProtocol {

    // MARK: - IBOutlets

    @IBOutlet weak var byeButton: CustomButton!
    @IBOutlet weak var tableView: DiffableTableView!
    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: BasketPresenterProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareTable()
    }

    // MARK: - IBActions

    @IBAction func byeButtonTapped(_ sender: CustomButton) {
    }
    // MARK: - Private methods

    // MARK: - Public methods

}
