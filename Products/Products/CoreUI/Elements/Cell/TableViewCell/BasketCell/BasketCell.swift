//
//  BasketCell.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit
import SDWebImage

// MARK: - BasketCell
class BasketCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var titleText: UILabel!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var productID: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var deleteButton: UIButton!

    // MARK: - Private properties

    // MARK: - Public properties
    var deleteProduct: (() -> Void)?

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.cornerRadius = 8
    }

    // MARK: - IBActions
    @IBAction func deleteProductTapped(_ sender: UIButton) {
        deleteProduct?()
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func configure(with viewModel: BasketViewModelProtocol) {
        titleText.text    = viewModel.titleText
        price.text        = "price: \(viewModel.price)"
        productID.text    = viewModel.subtitle
        productImage.sd_setImage(with: viewModel.productImage,
                                 placeholderImage: productImage.image,
                                 options: [], context: nil)
        deleteButton.isHidden = viewModel.isHideDeleteButton
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
