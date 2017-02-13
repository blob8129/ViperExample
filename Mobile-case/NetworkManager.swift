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
    let queue = OperationQueue()
    
    func loadData(url: URL, callBack: @escaping (DataResult) -> () ) {
        let dataOperation = DataOperation(url: url, callBack: callBack)
        queue.addOperation(dataOperation)
    }
    
    func cancel() {
        queue.cancelAllOperations()
    }
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
