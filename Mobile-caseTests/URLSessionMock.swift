//
//  URLSessionMock.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
@testable import Mobile_case


final class MockedDataTask: URLSessionDataTask {
    override func resume() {
        
    }
}

//struct URLSessionMock: DataTaskProtocol {
//    
//    var data: Data?
//    var response: URLResponse?
//    var error: Error?
//    
//    func dataTask(with url: URL,
//                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
//        
//        completionHandler(data, response, error)
//        
//        return MockedDataTask()
//    
//    }
//}

final class URLSessionMock: URLSession {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    override func dataTask(with url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        
        completionHandler(data, response, error)
        
        return MockedDataTask()
    }
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
}
