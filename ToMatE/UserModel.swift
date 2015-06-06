//
//  UserModel.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import ObjectMapper

class UserModel: Mappable {
    var name: String?
    var steps: Int?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        name <- map["name"]
        steps <- map["steps"]

    }
}