//
//  RecipeSearchBuilder.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 12/4/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


final class RecipeSearchBuilder: StroyboardInstantiator {
    
    func build(with navigationController: UINavigationController) -> UIViewController {
        let viewController: RecipeSearchTVC = instantiate(storyboardName: "RecipeSearch",
                                                          viewControllerStoryboardId: "RecipeSearchTVC")
        let interactor = RecipeSearchInteractor()
        let router = RecipeSearchRouter()
        router.navigationController = navigationController
        router.viewController = viewController
        let presenter = RecipeSearchPresenter(interactor: interactor,
                                              router: router)
        interactor.presenter = presenter
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
