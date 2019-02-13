//
//  SearchRouter.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> SearchViewController {
        let viewController:SearchViewController = AppStoryboard.Main.instance.instantiateVC()
        let presenter = SearchPresenter()
        let router = SearchRouter()
        let interactor = SearchInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension SearchRouter: SearchWireframe {
    // TODO: Implement wireframe methods
}
