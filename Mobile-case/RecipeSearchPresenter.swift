//
//  RecipeSearchPresenter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeSearchPresenter {
    let intractor: RecipeSearchInteractorInput
    
    init(interactor: RecipeSearchInteractorInput) {
        self.intractor = interactor
    }
}

extension RecipeSearchPresenter: RecipeSearchPresenterInput {
    func searchTermChanged(to term: String) {
        intractor.loadRecipes(for: term)
    }
}

extension RecipeSearchPresenter: RecipeSearchInteractorOutput {

}
