//
//  RecipeSearchPresenterInput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

protocol RecipeSearchPresenterInput {
    func searchTermChanged(to term: String)
    func numberOfRowsInSection() -> Int
    func titleFor(row: Int) -> String
    func willDisplayCellFor(row: Int)
    func imageFor(row: Int) -> UIImage?
}
