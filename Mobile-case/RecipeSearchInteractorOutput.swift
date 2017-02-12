//
//  RecipeSearchInteractorOutput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

protocol RecipeSearchInteractorOutput: class {
    func didLoadedRecipes(_ recipes: [Recipe])
    func errorDidOccured(_ error: Error)
}
