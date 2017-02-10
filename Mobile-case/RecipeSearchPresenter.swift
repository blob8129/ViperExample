//
//  RecipeSearchPresenter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeSearchPresenter: RecipeSearchPresenterInput {
    let intractor: RecipeSearchInteractorInput
    
    init(interactor: RecipeSearchInteractorInput) {
        self.intractor = interactor
    }
}

extension RecipeSearchPresenter: RecipeSearchInteractorOutput {

}
