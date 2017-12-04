//
//  Resourse.swift
//  RxAuth
//
//  Created by Andrey Volobuev on 23/12/2016.
//  Copyright © 2016 WhiteSoft. All rights reserved.
//

import Foundation


struct Resourse<T: JSONCreatable> {

    private let data: Data
    
    func getItem() throws -> T {
        let jsonAny = try getJson(from: data)
        return try T(json: jsonAny)
    }
    
    private func getJson(from data: Data) throws -> Any {
        return try JSONSerialization.jsonObject(with: data, options: [])
    }
    
    init(data: Data) {
        self.data = data
    }
}
