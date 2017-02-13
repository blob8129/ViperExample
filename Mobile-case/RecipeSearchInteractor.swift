//
//  RecipeSearchInteractor.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeSearchInteractor {
    fileprivate var pageNum = 1
    fileprivate let maxCount = 30
    fileprivate var isCanLoadNextPage = false
    weak var presenter: RecipeSearchInteractorOutput?
    fileprivate let recipeService = RecipeService()
    
    fileprivate func handleRecipeSuccess(data: Data, handler: (Page)->()) {
        do {
            let page = try Resourse<Page>(data: data).getItem()
            handler(page)
        } catch let error {
            presenter?.errorDidOccured(error)
        }
    }
    
    fileprivate func searchForRecipe(term: String, page: Int, handler: @escaping (Page)->()) {
        recipeService.searchForRecipe(term: term, page: pageNum) { result in
            
            switch result {
            case .sucess(let data, _):
                self.handleRecipeSuccess(data: data, handler: handler)
            case .error(let error):
                self.presenter?.errorDidOccured(error)
            }
        }
    }
    
    fileprivate func loadImages(for recipes: [Recipe], handler: @escaping (Data, URL)->()) {
        recipes.forEach { recipe in
            self.recipeService.loadData(url: recipe.imageUrl) { result in
                switch result {
                case .sucess(let data, let url):
                    handler(data, url)
                case .error(let error):
                    self.presenter?.errorDidOccured(error)
                }
            }
        }
    }
    
    fileprivate func handlePage(page: Page) {
        isCanLoadNextPage = page.count == self.maxCount
        self.loadImages(for: page.recipes, handler: imageHandler)
    }
    
    fileprivate func searchRecipeHandler(page: Page) {
        handlePage(page: page)
        presenter?.didLoadedRecipes(page.recipes)
    }
    
    fileprivate func nextPageHandler(page: Page) {
        handlePage(page: page)
        presenter?.didLoadedNextPage(page.recipes)
    }
    
    fileprivate func imageHandler(data: Data, url: URL) {
        self.presenter?.didLoadedImage(data: data, for: url)
    }
    
    func cancelPrevous() {
        print("cancel")
        recipeService.cancel()
        presenter?.didCanceledLoading()
    }
}

extension RecipeSearchInteractor: RecipeSearchInteractorInput {
    
    func loadRecipes(for term: String) {
        pageNum = 1
        searchForRecipe(term: term, page: pageNum, handler: searchRecipeHandler)
        presenter?.didStarteLoading(for: term)
    }
    
    func loadNextPage(for term: String) {
        guard isCanLoadNextPage == true else { return }
        pageNum += 1
        searchForRecipe(term: term, page: pageNum, handler: nextPageHandler)
        presenter?.didStarteLoading(for: term)
    }
}
