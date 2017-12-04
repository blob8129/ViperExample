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
    private let service = RecipeService()
    
    private func hadleSuccess(data: Data) {
        do {
            let recipieById = try Resourse<RecipeById>(data: data).getItem()
            self.presenter?.didLoadedById(recipe: recipieById)
        } catch let error {
            self.presenter?.errorDidOccured(error)
        }
    }
}

extension RecipeDetailsInteractor: RecipeDetailsInteractorInput {
    
    func loadRecipeBy(id: String) {
        service.loadRecipeBy(id: id) { result in
            switch result {
            case .sucess(let data, _):
                self.hadleSuccess(data: data)
            case .error(let error):
                self.presenter?.errorDidOccured(error)
            }
        }
    }
    
    func loadData(for url: URL) {
        service.loadData(url: url) { result in
            switch result {
            case .sucess(let data, _):
                self.presenter?.didLoaded(data: data)
            case .error(let error):
                self.presenter?.errorDidOccured(error)
            }
        }
    }
}
