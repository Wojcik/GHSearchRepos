//
//  NetworkClient.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

enum APICallError: Error {
    case unknownError
    case requestFailed(description: String?)
    case jsonDecodingError(description: String)
    case notFound
    case invalidrequest
    case invalidCredentials
    case invalidData
    case jsonParsingFailure
    
    init (statusCode code:Int) {
        switch code {
        case 400:
            self = .invalidrequest
        case 401:
            self = .invalidCredentials
        case 404:
            self = .notFound
        default:
            self = .unknownError
        }
    }
    
    var customDescription: String {
        switch self {
        case .unknownError:
            return "Unknown error happened"
        case .requestFailed(let description):
            return "Request failed -> \(description ?? "unknown error")"
        case .notFound:
            return "Resource not found"
        case .invalidrequest:
            return "Invalid request"
        case .invalidCredentials:
            return "Invalid Credentials"
        case .jsonDecodingError(let description):
            return "Failed to decode JSON -> \(description)"
        case .invalidData:
            return "Invalid data"
        case .jsonParsingFailure:
            return "Failed to decode JSON"
        }
    }
}

enum APIResult<T>{
    case success(T)
    case failure(APICallError)
}

class APIClient:APIClientProtocol {
    var session: NetworkSession = URLSession.shared
    
    init(session:URLSession) {
        self.session = session
    }
    
    func perform(request: Request, queue: DispatchQueue = .main, completion: @escaping (APIResult<Result>) -> Void) -> URLSessionDataTask{
        let task = session.perform(request: request.urlRequest, queue: queue) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: error?.localizedDescription)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            if 200..<300 ~= response.statusCode {
                completion(.success(Result(request:request, data:data)))
            } else {
                completion(.failure(APICallError(statusCode:response.statusCode)))
            }
            
        }
        return task
    }
}

