//
//  RecipeDetailsInteractorOutput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

protocol RecipeDetailsInteractorOutput: class {
    func didLoadedById(recipe: RecipeById)
    func didLoaded(data: Data)
    func errorDidOccured(_ error: Error)
}
