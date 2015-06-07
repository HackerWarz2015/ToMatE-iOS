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

class UserError: Mappable {
    var email: String?
    var name: String?
    var password: String?
    var passwordConf: String?

    init () {}

    required init?(_ map: Map) {

    }

    func mapping(map: Map) {
        email <- map["email"]
        name <- map["name"]
        password <- map["password"]
    }

}


class SHOWUserResponse: Mappable {
    
    var user: User?
    var errors: [String: String]?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        errors <- map["errors"]
        user <- map["user"]

    }

}

class POSTUserAuthenticationResponse {

}

class User: Mappable {

    var name: String?
    var steps: Int?
    var id: Int?
    var email: String?
    var friendIDs: [Int]?
    var token: String?

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
        token <- map["authentication_token"]
    }

    class func getAuthenticationParams(email: String, password: String) -> [String: AnyObject] {
        return ["user": ["email": email, "password": password]]
    }

    class func getCreateUserParams(name: String, email: String, password: String, passwordConf: String) -> [String: AnyObject] {
        return ["user": ["name": name, "email": email, "password": password, "password_confirmation": passwordConf], "registration": ["name": name, "email": email, "password": password, "password_confirmation": passwordConf]]
    }

}