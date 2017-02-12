//
//  RecipeSearchInteractor.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeSearchInteractor {
    var pageNum = 0
    weak var presenter: RecipeSearchInteractorOutput?
    let recipeService = RecipeService()
    
    fileprivate func handleRecipeSuccess(data: Data) {
        do {
            let page = try Resourse<Page>(data: data).getItem()
            presenter?.didLoadedRecipes(page.recipes)
        } catch let error {
            presenter?.errorDidOccured(error)
        }
    }
    
    fileprivate func searchForRecipe(term: String, page: Int) {
        recipeService.searchForRecipe(term: term, page: pageNum) { result in
            
            switch result {
            case .sucess(let data, _):
                self.handleRecipeSuccess(data: data)
            case .error(let error):
                self.presenter?.errorDidOccured(error)
            }
        }
    }
}

extension RecipeSearchInteractor: RecipeSearchInteractorInput {
    
    func loadRecipes(for term: String) {
        pageNum = 0
        searchForRecipe(term: term, page: pageNum)
    }
    
    func loadNextPage(for term: String) {
        pageNum += 1
        searchForRecipe(term: term, page: pageNum)
    }
}


