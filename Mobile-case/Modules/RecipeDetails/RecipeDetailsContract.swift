//
//  RecipeDetailsContract.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 12/4/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


protocol RecipeDetailsInteractorInput {
    func loadRecipeBy(id: String)
    func loadData(for url: URL)
}

protocol RecipeDetailsInteractorOutput: class {
    func didLoadedById(recipe: RecipeById)
    func didLoaded(data: Data)
    func errorDidOccured(_ error: Error)
}

protocol RecipeDetailsPresenterInput {
    func viewDidLoad()
    func urlForOriginal() -> URL
    func urlForInstructions() -> URL
}

protocol RecipeDetailsPresenterOutput: class {
    func show(ingredients: [String])
    func show(image: UIImage?)
    func configure(for viewModel: RecipeDetailsViewModel)
    func show(message: String)
}
