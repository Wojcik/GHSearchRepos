//
//  URLSession+Extensions.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/13/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation


protocol NetworkSession {
    typealias Completion = (Data?, URLResponse?, Error?) -> Void
    func perform(request:URLRequest,
                 queue:DispatchQueue,
                 completion:@escaping Completion
                 ) -> URLSessionDataTask
}

extension URLSession:NetworkSession {
    func perform(request: URLRequest, queue: DispatchQueue, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = dataTask(with: request) { (data, urlResponse, error) in
            queue.async {
                completion(data, urlResponse, error)
            }
        }
        task.resume()
        return task
    }
}
