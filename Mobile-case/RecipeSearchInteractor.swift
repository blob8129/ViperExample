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
    
    func loadRecipes(for term: String) {
        page = 0
        recipeService.searchForRecipe(term: term, page: page) { result in
        
        }
    }
    
    func loadNextPage(for term: String) {
        page += 1
        recipeService.searchForRecipe(term: term, page: page) { result in

        }
    }
}


