//
//  RecipeSearchInteractorInput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


protocol RecipeSearchInteractorInput {
    func loadRecipes(term: String)
    func loadNextPage(term: String)
}
