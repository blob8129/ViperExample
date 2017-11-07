//
//  RecipeService.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

struct RecipeService {
    
    // Could be loaded from keychain
    private let key = "3a38554ba7f81a95e201ded1f87968f0"
    
    private let networkManager = NetworkManager()
    
    func searchForRecipe(term: String, page: Int, callBack: @escaping (DataResult) -> ()) {
        let baseUrl = URLs.searchFood.getURL()
        let url = URLBuilder(url: baseUrl)
            .with(key: key)
            .with(searchTerm: term)
            .with(page: page)
            .url
        
        networkManager.loadData(url: url, callBack: callBack)
    }
    
    func loadData(url: URL, callBack: @escaping (DataResult) -> ()) {
        networkManager.loadData(url: url, callBack: callBack)
    }
    
    func loadRecipeBy(id: String, callBack: @escaping (DataResult) -> ()) {
        let baseUrl = URLs.getFoodById.getURL()
        let url = URLBuilder(url: baseUrl)
            .with(key: key)
            .with(id: id)
            .url
        networkManager.loadData(url: url, callBack: callBack)
    }
    
    func cancel() {
        networkManager.cancel()
    }
}
