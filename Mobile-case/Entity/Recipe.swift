//
//  Recipe.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 12/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

struct Recipe {
    let publisher: String
    let instructions: URL //"f2f_url": "http://food2fork.com/view/f5795c",
    let title: String
    let original: URL //"source_url": "http://www.pillsburybaking.com/recipes/details/706",
    let recipeId: String //recipe_id
    let imageUrl: URL //image_url
    let socialRank: Double // social_rank
}

extension Recipe: JSONCreatable {
    
    init(json: Any) throws {
        
        guard let jsonDict = json as? JSONDictonary else {
            throw SerializationError.wrongRootElement("Expected json dictionary not \(json)")
        }
        
        guard let recipeId = jsonDict["recipe_id"] as? String else {
            throw SerializationError.missing("recipe_id")
        }
        
        guard let publisher = jsonDict["publisher"] as? String else {
            throw SerializationError.missing("publisher")
        }
        
        guard  let title = jsonDict["title"] as? String else {
            throw SerializationError.missing("title")
        }
        
        guard  let imageUrlStr = jsonDict["image_url"] as? String else {
            throw SerializationError.missing("image_url")
        }
        
        guard let imageUrl = URL(string: imageUrlStr) else {
            throw SerializationError.invalid("image_url is not a URL", imageUrlStr)
        }
        
        guard  let instructionsStr = jsonDict["f2f_url"] as? String else {
            throw SerializationError.missing("f2f_url")
        }
        
        guard let instructionsUrl = URL(string: instructionsStr) else {
            throw SerializationError.invalid("f2f_url is not a URL", imageUrlStr)
        }
        
        guard  let originalStr = jsonDict["source_url"] as? String else {
            throw SerializationError.missing("source_url")
        }
        
        guard let originalUrl = URL(string: originalStr) else {
            throw SerializationError.invalid("source_url is not a URL", imageUrlStr)
        }
        
        guard  let socialRank = jsonDict["social_rank"] as? Double else {
            throw SerializationError.missing("social_rank")
        }
    
        self.init(publisher: publisher,
                  instructions: instructionsUrl,
                  title: title,
                  original: originalUrl,
                  recipeId: recipeId,
                  imageUrl: imageUrl,
                  socialRank: socialRank)
    }
}
