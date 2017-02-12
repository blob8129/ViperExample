//
//  NetworkManager.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


enum DataResult {
    case sucess(data: Data, url: URL)
    case error(NetworkError)
}

struct NetworkManager {
    
    let session: URLSession
    
    func loadData(url: URL, callBack: @escaping (DataResult) -> () ) {
    
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                callBack(DataResult.error(
                    .unknown
                ))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                callBack(DataResult.error(
                    .nonHTTPResponse(response: response)
                ))
                return
            }
            guard 200..<300 ~= httpResponse.statusCode else {
                callBack(DataResult.error(
                    .httpRequestFailed(response: httpResponse, data: data)
                ))
                return
            }
            callBack(DataResult.sucess(data: data, url: url))
        }
        task.resume()
    }
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
