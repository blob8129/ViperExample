//
//  URLProvider.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 22/01/2017.
//  Copyright © 2017 WhiteSoft. All rights reserved.
//

import Foundation

protocol URLProvider: RawRepresentable {
}

extension URLProvider where RawValue == String {
    
    func getURL() -> URL {
        guard let url = URL(string: self.rawValue) else {
            fatalError("Unconstructable url \(self.rawValue)")
        }
        return url
    }
}
