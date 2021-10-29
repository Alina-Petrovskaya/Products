//
//  TabBarPresenter.swift
//  Products
//
//  Created by Alina Petrovskaya on 28.10.2021.
//

import Foundation

// MARK: - TabBarPresenterDelegate
protocol TabBarPresenterDelegate: AnyObject { }

// MARK: - TabBarPresenterProtocol
protocol TabBarPresenterProtocol: AnyObject { }

// MARK: - TabBarPresenter
class TabBarPresenter: TabBarPresenterProtocol {

    // MARK: - Private properties
    private weak var delegate: TabBarPresenterDelegate!

    // MARK: - Public properties

    // MARK: Life cycle
    required init(delegate: TabBarPresenterDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private methods

    // MARK: - Public methods
    func prepareItems() {
    }
}
