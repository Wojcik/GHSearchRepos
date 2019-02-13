//
//  UIView.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import UIKit

extension UIStoryboard {
    func instantiateVC<T:UIViewController>() -> T where T:ReusableView {
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }
}
