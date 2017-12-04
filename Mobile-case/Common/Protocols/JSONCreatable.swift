//
//  JSONCreatable.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 28/12/2016.
//  Copyright © 2016 WhiteSoft. All rights reserved.
//

import Foundation

typealias JSONDictonary = [String: Any]
typealias JSONArray = [[String: Any]]

protocol JSONCreatable {
    init(json: Any) throws
}
