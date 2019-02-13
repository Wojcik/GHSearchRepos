//
//  GithubRequest.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/11/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

extension String {
    static let authorizationKey = "Authorization"
    static let credentials = "Credentials"
}

enum GithubRequest: Request {
    case login(userName:String, password:String)
    case search(repoName:String, page:Int, perPage:Int)
    
    var method: RequestMethod {
        switch self {
        case .login, .search:
            return .get
        }
    }
    
    var resultType: ResultType {
        switch self {
        case .login, .search:
            return .json
        }
    }

    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/user"
        case .search:
            return "/search/repositories"
        }
    }
    
    var headers: StringAnyDict? {
        switch self {
        case let .login(userName, password):
            let credentialsString = "\(userName):\(password)"
            guard let credentialsData = credentialsString.data(using: .utf8)?.base64EncodedString() else {
                return [:]
            }
            return [.authorizationKey: "Basic \(credentialsData)"]
        case .search:
            return UserDefaults.standard.object(forKey: .authorizationKey) as? StringAnyDict ?? [:]
        }
    }
    
    var parameters: RequestParameters {
        switch self {
        case .login:
            return .url([:])
        case let .search(repoName, page, perPage):
            do {
                let jsonData = try JSONEncoder().encode(SearchParameters(query:repoName, page:page, perPage: perPage, sort: "stars", order:.desc))
                return .url(try JSONSerialization.jsonObject(with: jsonData, options: []) as! StringAnyDict)
            } catch {
                print(error.localizedDescription)
                return .url([:])
            }
        }
        
    }
}


