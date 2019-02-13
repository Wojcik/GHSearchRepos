//
//  SearchParameters.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/11/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

enum Order:String, Encodable {
    case asc
    case desc
}

struct SearchParameters:Encodable {
    let query:String
    let page:Int
    let perPage:Int
    let sort:String
    let order:Order
    
    enum CodingKeys:String, CodingKey {
        case query = "q"
        case perPage = "per_page"
    }
}
