//
//  SearchPresenter.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

class SearchPresenter {

    // MARK: Properties

    weak var view: SearchView?
    var router: SearchWireframe?
    var interactor: SearchUseCase?
}

extension SearchPresenter: SearchPresentation {
    // TODO: implement presentation methods
}

extension SearchPresenter: SearchInteractorOutput {
    // TODO: implement interactor output methods
}
