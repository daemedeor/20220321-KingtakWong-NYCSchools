//
//  BaseNetworkClass.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation

class BaseNetworkClass: Operation {
    let operationQueue: OperationQueue = OperationQueue.main
    var currentTask: URLSessionTask?
    let credential: Credential

    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }

    override var isExecuting: Bool {
        return _executing
    }

    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }

        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }

    override var isFinished: Bool {
        return _finished
    }

    func executing(_ executing: Bool) {
        _executing = executing
    }

    func finish(_ finished: Bool) {
        _finished = finished
    }
    
    init(credential: Credential) {
        self.credential = credential
    }
}
