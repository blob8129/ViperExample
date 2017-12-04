//
//  NetworkError.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    case unknown
    case nonHTTPResponse(response: URLResponse)
    case httpRequestFailed(response: HTTPURLResponse, data: Data)
}

func ==(lhs: NetworkError, rhs: NetworkError) -> Bool {
    switch (lhs, rhs) {
    case (.unknown, .unknown):
        return true
    case (.nonHTTPResponse(let respLhs),
          .nonHTTPResponse(let respRhs)):
        return respLhs == respRhs
    case (.httpRequestFailed(let respLhs, let dataLhs),
          .httpRequestFailed(let respRhs, let dataRhs)):
        return respLhs == respRhs && dataLhs == dataRhs
    default:
        return false
    }
}
