//
//  APIRequest.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/5/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

typealias StringAnyDict = [String:Any]

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ResultType {
    case json
    case data
}

enum RequestParameters {
    typealias Parameters = [String: Any]
    case body(_: Parameters)
    case url(_ :Parameters)
}

protocol Request {
    var method:RequestMethod { get }
    var baseURL:URL { get }
    var path: String { get }
    var headers: StringAnyDict? { get }
    var parameters: RequestParameters { get }
    var resultType: ResultType { get }
}

extension Request {
    var absoluteURL:String {
        return baseURL.absoluteString + path
    }
}

extension Request {
    var urlRequest: URLRequest {
        guard let url = URL(string: absoluteURL) else { fatalError() }
        var request = URLRequest(url:url)
        switch parameters {
        case .body(let params):
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        case .url(let params):
            let queryParams = params.map { item -> URLQueryItem in
                return URLQueryItem(name: item.key, value: .init(describing:item.value))
            }
            guard var components = URLComponents(string: absoluteURL) else { fatalError() }
            components.queryItems = queryParams
            request.url = components.url
        }
        headers?.forEach {
            request.setValue(.init(describing:$0.value), forHTTPHeaderField: $0.key)
        }
        
        return request
    }
}



