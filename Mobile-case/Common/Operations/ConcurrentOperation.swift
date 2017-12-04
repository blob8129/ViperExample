//
//  ConcurrentOperation.swift
//  INeedService
//
//  Created by Andrey Volobuev on 15/08/16.
//  Copyright © 2016 insalab. All rights reserved.
//

import UIKit

class ConcurrentOperation: Operation {
    
    // MARK: - Types
    enum State {
        case ready, executing, finished
        func keyPath() -> String {
            switch self {
            case .ready:
                return "isReady"
            case .executing:
                return "isExecuting"
            case .finished:
                return "isFinished"
            }
        }
    }
    
    // MARK: - Properties
    var state = State.ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath())
            willChangeValue(forKey: state.keyPath())
        }
        didSet {
            didChangeValue(forKey: oldValue.keyPath())
            didChangeValue(forKey: state.keyPath())
        }
    }
    
    // MARK: - NSOperation
    override var isReady: Bool {
        return super.isReady && state == .ready
    }
    
    override var isExecuting: Bool {
        return state == .executing
    }
    
    override var isFinished: Bool {
        return state == .finished
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override func start() {
        if isCancelled == true {
            state = .finished
        } else {
            state = .executing
            main()
        }
    }
}
