//
//  TableHeaderView.swift
//  Products
//
//  Created by Alina Petrovskaya on 29.10.2021.
//

import UIKit

// MARK: - TableHeaderView
class TableHeaderView: UIView, NibLoadable {

    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!

    // MARK: - Private properties

    // MARK: - Public properties

    // MARK: - Life cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
        initialSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        initialSetup()
    }

    // MARK: - IBActions
    
    // MARK: - Private methods
    private func initialSetup() { }

    // MARK: - Public methods
    func configure(with viewModel: TableHeaderViewModelProtocol) {
        title.text = viewModel.title
    }

}
