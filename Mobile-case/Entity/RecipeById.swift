//
//  Ingredients.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

struct RecipeById {
    let ingredients: [String]
}

extension RecipeById: JSONCreatable {

    init(json: Any) throws {
        
        guard let jsonDict = json as? JSONDictonary else {
            throw SerializationError.wrongRootElement("Expected json dictionary not \(json)")
        }
        
        guard let recipe = jsonDict["recipe"] as? JSONDictonary else {
            throw SerializationError.missing("recipe")
        }
        
        guard let ingredientsArr = recipe["ingredients"] as? [Any] else {
            throw SerializationError.missing("ingredients")
        }
        
        let ingredients: [String] = try ingredientsArr.map {
            guard let ingredient = $0 as? String  else {
                throw SerializationError.invalid("Ingredient is not a string", $0)
            }
            return ingredient
        }
        
        self.init(ingredients: ingredients)
    }
}
