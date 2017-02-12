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
    let key = "b549c4c96152e677eb90de4604ca61a2"
    
    let networkManager = NetworkManager()
    
    func searchForRecipe(term: String, page: Int, callBack: @escaping (DataResult) -> ()) {
        let baseUrl = URLs.searchFood.getURL()
        let url = URLBuilder(url: baseUrl)
            .with(key: key)
            .with(searchTerm: term)
            .with(page: page)
            .url
        
        networkManager.loadData(url: url, callBack: callBack)
    }
}
