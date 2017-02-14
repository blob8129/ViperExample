//
//  DataOperation.swift
//  INeedService
//
//  Created by Andrey Volobuev on 06/11/2016.
//  Copyright © 2016 insalab. All rights reserved.
//

import UIKit

final class DataOperation: ConcurrentOperation {
    lazy var session = URLSession.shared
    fileprivate let url: URL
    fileprivate let callBack: (DataResult) -> ()
    
    override func main() {
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard self.isCancelled == false else {
                self.state = .finished
                return
            }
            
            guard let data = data, let response = response else {
                self.callBack(DataResult.error(
                    .unknown
                ))
                self.state = .finished
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.callBack(DataResult.error(
                    .nonHTTPResponse(response: response)
                ))
                self.state = .finished
                return
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                self.callBack(DataResult.error(
                    .httpRequestFailed(response: httpResponse, data: data)
                ))
                self.state = .finished
                return
            }
            
            self.callBack(DataResult.sucess(data: data, url: self.url))
            self.state = .finished
        }
        
        task.resume()
    }
    
    init(url: URL, callBack: @escaping (DataResult) -> ()) {
        self.url = url
        self.callBack = callBack
    }
}
