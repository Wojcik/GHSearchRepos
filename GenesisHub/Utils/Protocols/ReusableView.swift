//
//  ReusableView.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation

protocol ReusableView: class {
}

extension ReusableView {
    static var reuseIdentifier:String  {
        return String(describing: self)
    }
}

