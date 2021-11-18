//
//  FooterIndicatorView.swift
//  calme
//
//  Created by Alina Petrovskaya on 02.08.2021.
//

import UIKit

// MARK: - FooterIndicatorView
class FooterIndicatorView: UIView, NibLoadable {

    // MARK: - IBOutlets

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
    private func initialSetup() {
    }

    // MARK: - Public methods
    func configure(with viewModel: FooterIndicatorViewModelProtocol) {
    }

}
