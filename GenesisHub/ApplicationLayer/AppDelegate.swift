//
//  AppDelegate.swift
//  GenesisHub
//
//  Created by Anton Kovalov on 2/12/19.
//  Copyright © 2019 Anton Kovalov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appConfigurator:AppConfigurator = ApplicationConfiguratorImplementation()
    var window: UIWindow?
    let apiClient = APIClient(session: .shared)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appConfigurator.setupCoreDataStack()
        
        return true
    }
}

