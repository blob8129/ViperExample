//
//  URLBuilder.swift
//  Dashboard
//
//  Created by Andrey Volobuev on 22/01/2017.
//  Copyright © 2017 WhiteSoft. All rights reserved.
//

import Foundation

struct URLBuilder {
    
    let url: URL
    
    private func with(queries: [String: String], for url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        if components?.queryItems == nil {
            components?.queryItems = queryItems
        } else {
            components?.queryItems?.append(contentsOf: queryItems)
        }
        
        guard let urlComponents = components, let constructedUrl = urlComponents.url else {
            fatalError("Unconstructable componets of \(url)")
        }
        
        return constructedUrl
    }
    
    func with(key: String) -> URLBuilder {
        let constructedUrl = with(queries: ["key": "\(key)"], for: url)
        return URLBuilder(url: constructedUrl)
    }
    
    func with(id: String) -> URLBuilder {
        let constructedUrl = with(queries: ["rId": "\(id)"], for: url)
        return URLBuilder(url: constructedUrl)
    }
    
    func with(searchTerm: String) -> URLBuilder {
        let constructedUrl = with(queries: ["q": "\(searchTerm)"], for: url)
        return URLBuilder(url: constructedUrl)
    }
    
    func with(page: Int) -> URLBuilder {
        let constructedUrl = with(queries: ["page": "\(page)"], for: url)
        return URLBuilder(url: constructedUrl)
    }
}
