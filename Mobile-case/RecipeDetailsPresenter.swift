//
//  RecipeDetailsPresenter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

final class RecipeDetailsPresenter {
    weak var view: RecipeDetailsPresenterOutput?
    fileprivate let router: RecipeDetailsRouter
    fileprivate let interactor: RecipeDetailsInteractorInput
    
    fileprivate let recipe: Recipe
    
    init(recipe: Recipe,
         router: RecipeDetailsRouter,
         interactor: RecipeDetailsInteractorInput) {
        self.recipe = recipe
        self.router = router
        self.interactor = interactor
    }
}

extension RecipeDetailsPresenter: RecipeDetailsPresenterInput {
    
    func viewDidLoad() {
        interactor.loadRecipeBy(id: recipe.recipeId)
        interactor.loadData(for: recipe.imageUrl)
        
        let viewModel = RecipeDetailsViewModel(title: recipe.title,
                                               publisher: recipe.publisher,
                                               socialRank: "Social rank: \(String(format: "%.2f", recipe.socialRank))")
        view?.configure(for: viewModel)
    }
    
    func urlForOriginal() -> URL {
        return recipe.original
    }
    
    func urlForInstructions() -> URL {
        return recipe.instructions
    }
}

extension RecipeDetailsPresenter: RecipeDetailsInteractorOutput {
    
    func didLoadedById(recipe: RecipeById) {
        DispatchQueue.main.sync {
            self.view?.show(ingredients: recipe.ingredients)
        }
    }
    
    func didLoaded(data: Data) {
        let image = UIImage(data: data)
        DispatchQueue.main.sync {
            self.view?.show(image: image)
        }
    }
    
    func errorDidOccured(_ error: Error) {
        DispatchQueue.main.async {
            self.view?.show(message: error.localizedDescription)
        }
    }
}
