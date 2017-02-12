//
//  SerializationError.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 28/12/2016.
//  Copyright © 2016 WhiteSoft. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case wrongRootElement(String)
    case missing(String)
    case invalid(String, Any)
}
