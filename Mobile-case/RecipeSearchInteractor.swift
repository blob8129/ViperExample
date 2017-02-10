//
//  RecipeSearchInteractor.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeSearchInteractor {
    var page = 0
    weak var presenter: RecipeSearchInteractorOutput?
    let recipeService = RecipeService()
}

extension RecipeSearchInteractor: RecipeSearchInteractorInput {
    func loadRecipes(term: String) {
        page = 0
        recipeService.searchForRecipe(term: term, page: page)
    }
    
    func loadNextPage(term: String) {
        recipeService.searchForRecipe(term: term, page: page + 1)
    }
}
