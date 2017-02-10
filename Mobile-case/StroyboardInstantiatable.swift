//
//  StroyboardInitiatable.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 09/01/2017.
//  Copyright © 2017 WhiteSoft. All rights reserved.
//

import UIKit


protocol StroyboardInstantiatable: ViewControllerTypeProtocol {
    var storyboardName: String { get }
    var viewControllerStoryboardId: String { get }
}

extension StroyboardInstantiatable {
    
    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    
    func instantiate() -> ViewControllerType {
        return getStoryboard().instantiateViewController(withIdentifier: viewControllerStoryboardId) as! ViewControllerType
    }
}
