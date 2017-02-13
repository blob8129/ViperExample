//
//  RecipeDetailsInteractorInput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

protocol RecipeDetailsInteractorInput {
    func loadRecipeBy(id: String)
    func loadData(for url: URL)
}
