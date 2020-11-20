//
//  Service.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

struct Service {
    func request(_ route: Router, useSessionManager: Bool = true) -> DataRequest {
        var url = Router.apiBaseURL
        
        url = url.appendingPathComponent(route.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = route.method.rawValue
        
        
        
        do {
            request = try route.encode(request: request)
            let rq = useSessionManager ? sessionManager.request(request) : AF.request(request)
            print(rq.description)
            return rq
        } catch {
            let rq = useSessionManager ? sessionManager.request(request) : AF.request(request)
            print(rq.description)
            return rq
        }
    }
}
