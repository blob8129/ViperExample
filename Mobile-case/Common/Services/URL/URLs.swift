//
//  URLs.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 22/01/2017.
//  Copyright © 2017 WhiteSoft. All rights reserved.
//

import Foundation


enum URLs: String, URLProvider {
    
    case getFoodById = "http://food2fork.com/api/get"
    
    case searchFood = "http://food2fork.com/api/search"
    
    func getURL() -> URL {
        guard let url = URL(string: self.rawValue) else {
            fatalError("Unconstructable url \(self.rawValue)")
        }
        return url
    }
}
