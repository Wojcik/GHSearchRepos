//
//  Result.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/13/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

struct Result {
    let request:Request
    let data: Data
    
    func map<T>(to type:T.Type) throws -> T where T:Decodable {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw APICallError.jsonDecodingError(description: error.localizedDescription)
        }
    }
}
