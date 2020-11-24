//
//  SessionManager.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Foundation
import Alamofire
import RxAlamofire

let sessionManager: SessionManager = {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 30
    let sm = SessionManager(configuration: config)
    return sm
}()
