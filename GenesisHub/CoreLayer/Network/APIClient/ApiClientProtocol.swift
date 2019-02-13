//
//  ApiClientProtocol.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/13/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    var session:NetworkSession { get }
    func perform(request: Request,
                 queue:DispatchQueue,
                 completion: @escaping (APIResult<Result>) -> Void) -> URLSessionDataTask
}
