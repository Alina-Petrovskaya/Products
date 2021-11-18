//
//  UserInfoCell.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import UIKit

// MARK: - UserInfoCell
class UserInfoCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var totalOrders: UILabel!

    // MARK: - Private properties

    // MARK: - Public properties

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - IBActions

    // MARK: - Private methods

    // MARK: - Public methods
    func configure(with viewModel: UserInfoViewModelProtocol) {
        userName.text = viewModel.userName
        email.text = viewModel.email
        totalOrders.text = "Total orders count: \(viewModel.totalOrders)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
