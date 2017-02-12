//
//  RecipeSearchPresenter.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeSearchPresenter {
    var recipes = [Recipe]()
    
    weak var view: RecipeSearchPresenterOutput?
    fileprivate let intractor: RecipeSearchInteractorInput
    private var timer: Timer?
    
    init(interactor: RecipeSearchInteractorInput) {
        self.intractor = interactor
    }
    
    fileprivate func debounceAndSerch(term: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0,
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
        print("Timer for \(term)")
        intractor.loadRecipes(for: term)
        
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
    
}

extension RecipeSearchPresenter: RecipeSearchInteractorOutput {
    func didLoadedRecipes(_ recipes: [Recipe]) {
        self.recipes = recipes
        
        DispatchQueue.main.async {
            self.view?.update()
        }
    }
    
    func errorDidOccured(_ error: Error){
    
    }
}
