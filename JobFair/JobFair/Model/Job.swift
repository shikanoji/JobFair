//
//  Job.swift
//  JobFair
//
//  Created by Nguyễn Đình Thạch on 25/11/2020.
//

import Foundation
import ObjectMapper
import Then

struct Job {
    var name: String
    var quantity: String
    var salary: String
    var country: String
}

extension Job {
    init() {
        self.init(name: "",
                  quantity: "",
                  salary: "",
                  country: "")
    }
}

extension Job: Then { }

extension Job: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        name <- map["job"]
        quantity <- map["quantity"]
        salary <- map["salary"]
        country <- map["country"]
    }
}

