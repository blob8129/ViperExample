//
//  RecipeDetailsInteractor.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


final class RecipeDetailsInteractor {
    weak var presenter: RecipeDetailsInteractorOutput?
    fileprivate let service = RecipeService()
}

extension RecipeDetailsInteractor: RecipeDetailsInteractorInput {
    func loadRecipeBy(id: String) {
        
        service.loadRecipeBy(id: id) { result in
            switch result {
            case .sucess(let data, _):
                let recipieById = try! Resourse<RecipeById>(data: data).getItem()
                
                self.presenter?.didLoadedById(recipe: recipieById)
            case .error(let error):
                break
            }
        }
    }
    
    func loadData(for url: URL) {
        service.loadData(url: url) { result in
            switch result {
            case .sucess(let data, _):
                self.presenter?.didLoaded(data: data)
            case .error(let error):
                break
            }
        }
    }

}
