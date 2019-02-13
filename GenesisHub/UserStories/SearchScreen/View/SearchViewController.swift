//
//  SearchViewViewController.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation
import UIKit

//
//  FirstViewController.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: UIViewController, ReusableView {
    let loginService:LoginService = LoginService(apiClient: (UIApplication.shared.delegate as! AppDelegate).apiClient)
    let searchService:SearchService = SearchService(paginator: Paginator(), apiClient: (UIApplication.shared.delegate as! AppDelegate).apiClient)
    // MARK: Properties
    @IBOutlet weak var searchBar: UISearchBar!
    var presenter: SearchPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
//        loginService.login(userName: "kovalev.main@gmail.com", password: "TbPotW15") { user, error in
//            if let user = user {
//                dump(user)
//            } else {
//                print(error)
//            }
//        }
        
        searchService.search(query: "test") { string in
            print(string)
        }
    }
}

extension SearchViewController: SearchView {
    // TODO: implement view output methods
}

