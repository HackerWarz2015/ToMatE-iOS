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


class UserTask: Mappable {

    var title: String?
    var limitDate: NSDate?
    var difficulty: Int?
    var steps: Int?
    var failureAt: NSDate?
    var userID: Int?
    var doneAt: NSDate?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        title <- map["title"]
        limitDate <- map["limit_date"]
        difficulty <- map["difficulty"]
        steps <- map["steps"]
        failureAt <- map["failure_at"]
        userID <- map["user_id"]
        doneAt <- map["done_at"]
    }

}