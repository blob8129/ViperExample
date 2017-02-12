//
//  RecipeSearchPresenter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit


final class RecipeSearchPresenter {
    var recipes = [Recipe]()
    var imagesDict = [URL: (index: Int, image: UIImage?)]()
    
    private let debounceInterval = 1.0
    fileprivate var currentTerm = ""
    weak var view: RecipeSearchPresenterOutput?
    fileprivate let intractor: RecipeSearchInteractorInput
    private var timer: Timer?
    
    init(interactor: RecipeSearchInteractorInput) {
        self.intractor = interactor
    }
    
    fileprivate func debounceAndSerch(term: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: debounceInterval,
                                     target: self,
                                     selector: #selector(searchTermDebounced),
                                     userInfo: term,
                                     repeats: false)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    @objc func searchTermDebounced(timer: Timer) {
        guard let userInfo = timer.userInfo,
            let term = userInfo as? String else {
            return
        }
        intractor.loadRecipes(for: term)
    }
    
    fileprivate func configureImages(for recipes: [Recipe]) {
        self.recipes.enumerated().forEach { offset, recipe in
            imagesDict[recipe.imageUrl] = (offset, imagesDict[recipe.imageUrl]?.image)
        }
    }
}

extension RecipeSearchPresenter: RecipeSearchPresenterInput {
    func searchTermChanged(to term: String) {
        guard term != "" else {
            recipes = []
            view?.update()
            return
        }
        debounceAndSerch(term: term)
    }
    
    func numberOfRowsInSection() -> Int {
        return recipes.count
    }
    
    func titleFor(row: Int) -> String {
        return recipes[row].title
    }
    
    func willDisplayCellFor(row: Int) {
        if row == recipes.count - 1 {
            intractor.loadNextPage(for: currentTerm)
        }
    }
    
    func imageFor(row: Int) -> UIImage? {
        let url = recipes[row].imageUrl
        return imagesDict[url]?.image
    }

}

extension RecipeSearchPresenter: RecipeSearchInteractorOutput {
    
    func didLoadedRecipes(_ recipes: [Recipe]) {
        self.recipes = recipes
        configureImages(for: recipes)
        DispatchQueue.main.async {
            self.view?.hideActivityIndictor()
            self.view?.update()
        }
    }
    
    func didLoadedNextPage(_ recipes: [Recipe]) {
        self.recipes += recipes
        configureImages(for: recipes)
        DispatchQueue.main.async {
            self.view?.hideActivityIndictor()
            self.view?.update()
        }
    }
    
    func errorDidOccured(_ error: Error){
        view?.hideActivityIndictor()
    }
    
    func didLoadedImage(data: Data, for url: URL) {
        guard recipes.count > 0  else { return }
        guard let imageIndex = imagesDict[url]?.index else { return }
        imagesDict[url] = (imageIndex, UIImage(data: data))
        DispatchQueue.main.async {
            self.view?.update(row: imageIndex)
        }
    }
    
    func didStarteLoading(for term: String) {
        currentTerm = term
        view?.showActivityIndictor()
    }
}
