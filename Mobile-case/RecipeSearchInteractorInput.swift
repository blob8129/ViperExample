//
//  RecipeSearchInteractorInput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


protocol RecipeSearchInteractorInput {
    func loadRecipes(for term: String)
    func loadNextPage(for term: String)
    func cancelPrevous()
}
