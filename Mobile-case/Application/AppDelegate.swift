//
//  AppDelegate.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let rootNavigationController = UINavigationController()
        let vc = RecipeSearchBuilder().build(with: rootNavigationController)
        rootNavigationController.pushViewController(vc, animated: false)

        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
