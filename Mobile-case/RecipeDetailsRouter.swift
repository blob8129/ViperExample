//
//  RecipeDetailsRouter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


struct RecipeDetailsRouter: StroyboardInstantiatable, Navigatable {
    
    // View Controller Type Protocol
    typealias ViewControllerType = RecipeDetailsVC
    
    // MARK: Navigatable
    weak var viewController: ViewControllerType?
    weak var navigationController: UINavigationController?
    
    // MARK: Stroyboard Instantiatable
    let storyboardName = "RecipeDetails"
    let viewControllerStoryboardId = "RecipeDetailsVC"
    
    private func assemble(context: Recipe) {
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter(recipe: context,
                                               router: self,
                                               interactor: interactor)
        interactor.presenter = presenter
        presenter.view = viewController
        viewController?.presenter = presenter
    }
    
    init(recipe: Recipe) {
        viewController = instantiate()
        assemble(context: recipe)
    }
}

