//
//  RecipeSearchPresenter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeSearchPresenter {
    var recipes = [Recipe]()
    
    weak var view: RecipeSearchPresenterOutput?
    fileprivate let intractor: RecipeSearchInteractorInput
    
    init(interactor: RecipeSearchInteractorInput) {
        self.intractor = interactor
    }
}

extension RecipeSearchPresenter: RecipeSearchPresenterInput {
    func searchTermChanged(to term: String) {
        guard term != "" else {
            recipes = []
            view?.update()
            return 
        }
        intractor.loadRecipes(for: term)
    }
    
    func numberOfRowsInSection() -> Int {
        return recipes.count
    }
    
    func titleFor(row: Int) -> String {
        return recipes[row].title
    }
    
}

extension RecipeSearchPresenter: RecipeSearchInteractorOutput {
    func didLoadedRecipes(_ recipes: [Recipe]) {
        self.recipes = recipes
        
        DispatchQueue.main.async {
            self.view?.update()
        }
    }
    
    func errorDidOccured(_ error: Error){
    
    }
}
