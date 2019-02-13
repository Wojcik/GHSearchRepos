//
//  SearchService.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/13/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

protocol SearchServiceProtocol: Service {
    var paginator: Paginator { get }    
    func search(query: String, completion: @escaping (String) -> ())
}

struct SearchService:SearchServiceProtocol {
    var paginator: Paginator = Paginator()
    var apiClient: APIClientProtocol

    func search(query: String, completion: @escaping (String) -> ()) {
        apiClient.perform(request: GithubRequest.search(repoName: query, page: paginator.currentPage, perPage: 30), queue: .main) { result in
            switch result {
            case .success(let resultData):
                var resultString = String(data:resultData.data, encoding: .utf8)!
                print(resultString)
                completion(resultString)
            case .failure(let error):
                print(error)
            }

        }
    }
}
