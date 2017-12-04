//
//  RecipeSearchRouter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


final class RecipeSearchRouter: Navigatable {
    
    // View Controller Type Protocol
    typealias ViewControllerType = RecipeSearchTVC
    
    // MARK: Navigatable
    weak var viewController: ViewControllerType?
    weak var navigationController: UINavigationController?

    func navigateToDetails(of recipe: Recipe) {
        let vc = RecipeDetailsBuilder().build(recipe: recipe)
        navigationController?.pushViewController(vc, animated: true)
    }
}
