//
//  OrderTotalCell.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit

// MARK: - OrderTotalCell
class OrderTotalCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var total: UILabel!

    // MARK: - Private properties

    // MARK: - Public properties

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.layer.cornerRadius  = 20
        contentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        contentView.layer.masksToBounds = true
    }

    // MARK: - IBActions

    // MARK: - Private methods

    // MARK: - Public methods
    func configure(with viewModel: OrderTotalViewModelProtocol) {
        total.text = "Total: \(viewModel.total)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
