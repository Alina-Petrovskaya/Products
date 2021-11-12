//
//  ProductCell.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit
import SDWebImage

// MARK: - ProductCell
class ProductCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var titleText: UILabel!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var roundedBackground: UIView!
    @IBOutlet private weak var byeButton: UIButton!

    // MARK: - Private properties
    private var isSetGradient = false

    // MARK: - Public properties
    var byeButtonTapped: (() -> Void)?

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func draw(_ rect: CGRect) {
        if !isSetGradient {
            roundedBackground.setBackgroundGradient(20, opacity: 0.2)
            isSetGradient = true
        }
        roundedBackground.layer.cornerRadius = 20
        byeButton.layer.cornerRadius         = byeButton.bounds.height / 2
        productImage.layer.cornerRadius      = productImage.bounds.height / 2
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cellActionButtonLabel?.textColor = ColorConstant.darkBlueBackground.getColor()
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        cellActionButtonLabel?.textColor = ColorConstant.darkBlueBackground.getColor()
    }

    // MARK: - IBActions
    @IBAction func byeButtonTapped(_ sender: UIButton) {
        byeButtonTapped?()
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func configure(with viewModel: ProductViewModelProtocol) {
        titleText.text = viewModel.title
        price.text = "\(viewModel.price)"
        productImage.sd_setImage(with: viewModel.image,
                                 placeholderImage: productImage.image,
                                 options: [],
                                 context: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
