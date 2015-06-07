//
//  UserTaskModel.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import ObjectMapper

class GETUserTasksResponse: Mappable {

    var userTasks: [UserTask]?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        userTasks <- map["user_tasks"]
    }

}

class PUTUserTasksResponse: Mappable {

    var userTask: UserTask?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        userTask <- map["user_task"]
    }

}

class POSTUserTaskResponse: Mappable {
    var userTask: UserTask?
    var errors: [String: String]?
    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        userTask <- map["user_task"]
        errors <- map["errors"]
    }
}

class UserTask: Mappable {

    var id: Int?
    var userID: Int?
    var title: String?
    var difficulty: Int?
    var steps: Int?
    var failureAt: NSDate?
    var doneAt: NSDate?
    var limitDate: NSDate?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        limitDate <- map["limit_at"]
        difficulty <- map["difficulty"]
        steps <- map["steps"]
        failureAt <- map["failure_at"]
        userID <- map["user_id"]
        doneAt <- map["done_at"]
    }

    class func getCreateUserTaskParams(title: String, difficulty: Int, steps: Int, limit: String) -> [String: AnyObject] {
        return ["user_task": ["title": title, "difficulty": difficulty, "steps": steps, "limit": limit]]
    }

    class func getUpdateUserTaskParams(status: String, title: String, difficulty: Int, steps: Int) -> [String: AnyObject] {
        return ["status": status, "title": title, "difficulty": difficulty, "steps": steps]
    }

}