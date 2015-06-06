//
//  UserModel.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import ObjectMapper

class GETUsersResponse: Mappable {

    var users: [User]?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        users <- map["users"]
    }
    
}

class SHOWUserResponse: Mappable {
    
    var user: User?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        user <- map["user"]
    }

}


class User: Mappable {

    var name: String?
    var steps: Int?
    var id: Int?
    var email: String?
    var friendIDs: [Int]?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        name <- map["name"]
        steps <- map["steps"]
        id <- map["id"]
        email <- map["email"]
        friendIDs <- map["friend_ids"]
    }

}