//
//  NetworkManager.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


enum DataResult {
    case sucess(data: Data)
    case error(NetworkError)
}

struct NetworkManager {
    
    let callBack: (DataResult) -> ()
    let session: URLSession
    
    func loadData(url: URL) {
    
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                self.callBack(DataResult.error(
                    .unknown
                ))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                self.callBack(DataResult.error(
                    .nonHTTPResponse(response: response)
                ))
                return
            }
            guard 200..<300 ~= httpResponse.statusCode else {
                self.callBack(DataResult.error(
                    .httpRequestFailed(response: httpResponse, data: data)
                ))
                return
            }
            self.callBack(DataResult.sucess(data: data))
        }
        task.resume()
    }
    
    init(session: URLSession = URLSession.shared,
         callBack:  @escaping (DataResult) -> ()) {
        self.session = session
        self.callBack = callBack
    }
}
