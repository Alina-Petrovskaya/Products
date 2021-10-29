//
//  ProductsViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - ProductsViewController
class ProductsViewController: UIViewController, ProductsPresenterDelegate, DiffableTableUpdateProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: DiffableTableView!
    @IBOutlet private weak var addProduct: UIButton!

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: ProductsPresenterProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareTable()
        addProduct.setBackgroundGradient(addProduct.bounds.height / 2)
        addProduct.layer.cornerRadius = addProduct.bounds.height / 2
    }

    // MARK: - IBActions
    @IBAction func addProductTapped(_ sender: UIButton) {
        let addProductVC = ProductAddConfigurator().configure()
        present(addProductVC, animated: true)
    }

    // MARK: - Private methods

    // MARK: - Public methods

}
