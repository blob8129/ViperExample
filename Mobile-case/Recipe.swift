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
   // "f2f_url": "http://food2fork.com/view/f5795c",
    let title: String
    //"source_url": "http://www.pillsburybaking.com/recipes/details/706",
    let recipeId: String //recipe_id
    let imageUrl: URL //image_url
    let socialRank: Double // social_rank
   // "publisher_url": "http://www.pillsburybaking.com"
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
        
        guard  let socialRankStr = jsonDict["social_rank"] as? String else {
            throw SerializationError.missing("social_rank")
        }
        
        guard  let socialRank = Double(socialRankStr) else {
            throw SerializationError.invalid("image_url is not a number", socialRankStr)
        }
    
        self.init(publisher: publisher,
                  title: title,
                  recipeId: recipeId,
                  imageUrl: imageUrl,
                  socialRank: socialRank)
    }
}
