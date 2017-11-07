//
//  RecipeSearchRouter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


final class RecipeSearchRouter: StroyboardInstantiatable, Navigatable {
    
    // View Controller Type Protocol
    typealias ViewControllerType = RecipeSearchTVC
    
    // MARK: Navigatable
    weak var viewController: ViewControllerType?
    weak var navigationController: UINavigationController?
    
    // MARK: Stroyboard Instantiatable
    let storyboardName = "RecipeSearch"
    let viewControllerStoryboardId = "RecipeSearchTVC"
    
    func navigateToDetails(of recipe: Recipe) {
        var detailsRouter = RecipeDetailsRouter(recipe: recipe)
        detailsRouter.navigationController = navigationController
        detailsRouter.push()
    }
    
    private func assemble() {
        let interactor = RecipeSearchInteractor()
        let presenter = RecipeSearchPresenter(interactor: interactor,
                                              router: self)
        interactor.presenter = presenter
        presenter.view = viewController
        viewController?.presenter = presenter
    }

    init() {
        viewController = instantiate()
        assemble()
    }
}
