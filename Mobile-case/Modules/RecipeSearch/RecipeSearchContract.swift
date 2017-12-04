//
//  Contract.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 12/4/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


protocol RecipeSearchInteractorInput {
    func loadRecipes(for term: String)
    func loadNextPage(for term: String)
    func cancelPrevous()
}

protocol RecipeSearchInteractorOutput: class {
    func didLoadedRecipes(_ recipes: [Recipe])
    func didLoadedNextPage(_ recipes: [Recipe])
    func errorDidOccured(_ error: Error)
    func didLoadedImage(data: Data, for url: URL)
    func didStarteLoading(for term: String)
    func didCanceledLoading()
}

protocol RecipeSearchPresenterInput {
    func searchTermChanged(to term: String)
    func numberOfRowsInSection() -> Int
    func titleFor(row: Int) -> String
    func imageFor(row: Int) -> UIImage?
    
    func willDisplayCellFor(row: Int)
    func didSelectedRow(at index: Int)
}

protocol RecipeSearchPresenterOutput: class {
    func update()
    func update(row: Int)
    func showActivityIndictor()
    func hideActivityIndictor()
    func show(message: String)
}
