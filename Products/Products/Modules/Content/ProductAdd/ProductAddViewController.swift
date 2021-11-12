//
//  ProductAddViewController.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import UIKit
import MBProgressHUD

// MARK: - ProductAddViewController
class ProductAddViewController: UIViewController, HudViewProtocol, KeyboardStateObserver {

    // MARK: - IBOutlets
    @IBOutlet private weak var productName: UITextField!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productPrice: UITextField!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var productDescription: UITextField!
    @IBOutlet private weak var amount: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!

    // MARK: - Private properties
    private let imagePicker = ImagePicker()

    // MARK: - Public properties
    var presenter: ProductAddPresenterProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        productName.delegate        = self
        productPrice.delegate       = self
        productDescription.delegate = self
        amount.delegate             = self
        productImage.layer.cornerRadius = productImage.bounds.width / 2
        addHideKeyBoardRecognizer(for: view)
        setupKeyboardSubscriber()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - IBActions
    @IBAction func addImageTapped(_ sender: CustomButton) {
        let picker = imagePicker.getImagePicker(for: .photoLibrary, delegate: self)
        present(picker, animated: true)
    }
    
    @IBAction func saveProduct(_ sender: UIButton) {
        showHud("Loading...", to: view)
        saveButton.isHidden = true
        presenter.createProduct(name: productName.text,
                                amount: amount.text,
                                price: productPrice.text,
                                image: productImage.image?.pngData(),
                                productDescription: productDescription.text)
    }

    // MARK: - Private methods

    // MARK: - Public methods

}

// MARK: - ImagePickerDelegate
extension ProductAddViewController: ImagePickerDelegate {

    func didSelect(image: Data?) {
        guard let imageData = image else { return }
        productImage.image = UIImage(data: imageData)
    }

}

// MARK: - ProductAddPresenterDelegate
extension ProductAddViewController: ProductAddPresenterDelegate {

    func hideProgress(with result: HudResult) {
        showResult(from: view, result: result)
        saveButton.isHidden = false
        switch result {
        case .error:
            break

        case .success:
            productName.text        = ""
            productImage.image      = nil
            productPrice.text       = ""
            productDescription.text = ""
            amount.text             = ""
        }
    }

}

// MARK: - UITextFieldDelegate
extension ProductAddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
