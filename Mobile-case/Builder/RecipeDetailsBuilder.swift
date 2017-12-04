//
//  RecipeDetailsBuilder.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 12/4/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


final class RecipeDetailsBuilder: StroyboardInstantiator {
    
    func build(recipe: Recipe) -> UIViewController {
        let viewController: RecipeDetailsVC = instantiate(storyboardName: "RecipeDetails",
                                                          viewControllerStoryboardId: "RecipeDetailsVC")
        let interactor = RecipeDetailsInteractor()
        let presenter = RecipeDetailsPresenter(recipe: recipe, interactor: interactor)
        interactor.presenter = presenter
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
