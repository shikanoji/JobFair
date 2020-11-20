//
//  SessionManager.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Foundation
import Alamofire
import RxAlamofire

let sessionManager: Session = {
    let config = URLSessionConfiguration.af.default
    config.timeoutIntervalForRequest = 30
    config.headers = .default
    let sm = Session(configuration: config)
    return sm
}()
