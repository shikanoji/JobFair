//
//  Router.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Alamofire

enum Router {
    static let baseApi = ""
    static let apiBaseURL: URL = URL(string: "https://\(baseApi)")!
    
    case login
    case searchJob(searchText: String)
    
    var path: String {
        switch self {
        case .login:
            return Router.baseApi + "/login"
        case .searchJob(let searchText):
            return Router.baseApi + "/search/" + searchText
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .searchJob:
            return .get
        }
    }
    
    func encode(request: URLRequest) throws -> URLRequest {
        var urlRequest = request
        
        switch self {
        case .login, .searchJob(_ ):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        }
        
        return urlRequest
    }
}
