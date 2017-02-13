//
//  RecipeDetailsPresenterOutput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

protocol RecipeDetailsPresenterOutput: class {
    func show(ingredients: [String])
    func show(image: UIImage?)
    func configure(for viewModel: RecipeDetailsViewModel)
}
