//
//  LoginService.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

protocol LoginServiceProtocol: Service {
    func login(userName:String, password:String, completion:@escaping (User?, Error?)->Void)
}

struct LoginService: LoginServiceProtocol {
    let apiClient:APIClientProtocol

    func login(userName: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        apiClient.perform(request: GithubRequest.login(userName: userName, password: password), queue: .main) { result in
            switch result {
            case .success(let result):
                do {
                    let user = try result.map(to: User.self)
                    UserDefaults.standard.set(result.request.headers, forKey: .authorizationKey)
                    completion(user, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
