//
//  Navigatable.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 09/01/2017.
//  Copyright © 2017 WhiteSoft. All rights reserved.
//

import UIKit

protocol Navigatable: ViewControllerTypeProtocol {
    weak var navigationController: UINavigationController? { get set }
    weak var viewController: ViewControllerType? { get set }
}

extension Navigatable {
    func push() {
        precondition(navigationController != nil,
                     "Navigation Controller must not be nil to push \(self))")
        precondition(viewController != nil,
                     "View Controller must not be nil to push \(self)")
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    func pop() {
        precondition(navigationController != nil,
                     "Navigation Controller must not be nil to pop")
        let _ = navigationController?.popViewController(animated: true)
    }
}
