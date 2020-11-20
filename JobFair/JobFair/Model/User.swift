//
//  User.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Foundation
import ObjectMapper
import Then

struct User {
    var name: String
    var email: String
    var phone: String
    var idToken: String
}

extension User {
    init() {
        self.init(name: "",
                  email: "",
                  phone: "",
                  idToken: "")
    }
}

extension User: Then { }

extension User: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        phone <- map["phone"]
        idToken <- map["idToken"]
    }
}
