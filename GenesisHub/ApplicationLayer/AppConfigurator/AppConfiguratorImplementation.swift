//
//  ApplicationConfigurator.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import Foundation
import CoreData

class ApplicationConfiguratorImplementation: AppConfigurator {
    func setupCoreDataStack() {
        let persistentContainer = NSPersistentContainer(name: "GenesisHub")
        persistentContainer.loadPersistentStores { storeDescription, error in
            if error != nil {
                fatalError("Can't initialize core data stack")
            }
            print(storeDescription)
        }
    }
}
