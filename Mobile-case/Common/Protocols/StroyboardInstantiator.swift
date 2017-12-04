//
//  StroyboardInitiatable.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 09/01/2017.
//  Copyright © 2017 WhiteSoft. All rights reserved.
//

import UIKit


//protocol StroyboardInstantiatable: ViewControllerTypeProtocol {
//    var storyboardName: String { get }
//    var viewControllerStoryboardId: String { get }
//}
//
//extension StroyboardInstantiatable {
//
//    func getStoryboard() -> UIStoryboard {
//        return UIStoryboard(name: storyboardName, bundle: nil)
//    }
//
//    func instantiate() -> ViewControllerType {
//        return getStoryboard().instantiateViewController(withIdentifier: viewControllerStoryboardId) as! ViewControllerType
//    }
//}

protocol StroyboardInstantiator {}

extension StroyboardInstantiator {
    
    func instantiate<T: UIViewController>(storyboardName: String,
                                          viewControllerStoryboardId: String) -> T {
        return getStoryboard(storyboardName: storyboardName)
            .instantiateViewController(withIdentifier: viewControllerStoryboardId) as! T
    }
    
    private func getStoryboard(storyboardName: String) -> UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
}
