//
//  Page.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 12/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


struct Page {
    let count: Int
    let recipes: [Recipe]
}

extension Page: JSONCreatable {
    
    init(json: Any) throws {
        
        guard let jsonDict = json as? JSONDictonary else {
            throw SerializationError.wrongRootElement("Expected json dictionary not \(json)")
        }
        
        guard let count = jsonDict["count"] as? Int else {
            throw SerializationError.missing("count")
        }
        
        guard let recipesDict = jsonDict["recipes"] as? JSONDictonary else {
            throw SerializationError.missing("recipes")
        }
        
        let recipes =  recipesDict.map { Recipie.init }

        self.init(count: count,
                  recipes: recipes)

    }
}
