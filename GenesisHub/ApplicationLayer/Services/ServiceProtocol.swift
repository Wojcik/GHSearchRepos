//
//  ServiceProtocol.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/13/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

protocol Service {
    var apiClient:APIClientProtocol { get }
}
