//
//  BasketViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit

// MARK: - BasketViewController
class BasketViewController: UIViewController, BasketPresenterDelegate, DiffableTableUpdateProtocol, HudViewProtocol {

    // MARK: - IBOutlets
    @IBOutlet private weak var noProductsView: UIView!
    @IBOutlet private weak var buyButton: CustomButton!
    @IBOutlet weak var tableView: DiffableTableView!

    // MARK: - Private properties

    // MARK: - Public properties
    var presenter: BasketPresenterProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.prepareTableContent()
    }

    // MARK: - IBActions
    @IBAction func buyButtonTapped(_ sender: CustomButton) {
        showHud("", to: view)
        buyButton.isHidden = true
        presenter.buyButtonTapped()
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func isHiddenProducts(_ isHiddenTable: Bool) {
        print(isHiddenTable)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut,
                       animations: { [weak self] in
            self?.noProductsView.alpha = !isHiddenTable ? 0 : 1
            self?.buyButton.alpha      = isHiddenTable  ? 0 : 1
            self?.tableView.alpha      = isHiddenTable  ? 0 : 1
        },
                       completion: { [weak self] _ in
            self?.noProductsView.isHidden = !isHiddenTable
            self?.buyButton.isHidden      = isHiddenTable
            self?.tableView.isHidden      = isHiddenTable
        })
        
    }

    func hideProgress(with result: HudResult) {
        showResult(from: view, result: result)
    }

    func updateNumberOfItems(_ number: Int) {
        if number > 0 {
            tabBarItem.badgeValue = "\(number)"
        } else {
            tabBarItem.badgeValue = nil
        }
    }
}

// MARK: - ProductBuckedAddDelegate
extension BasketViewController: ProductBuckedAddDelegate {

    func productDeleted(model: ProductViewModel) {
        presenter.deleteProduct(model: model)
    }

    func newProductToBasket(model: ProductViewModel) {
        presenter.addNewProduct(model: model)
    }

}
