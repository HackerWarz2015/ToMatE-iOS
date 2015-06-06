//
//  UserTaskModel.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import ObjectMapper


class GetUserTasksResponse: Mappable {

    var userTasks: [UserTask]?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        userTasks <- map["user_tasks"]
    }

}


class UserTask: Mappable {

    var title: String?
    var limitDate: NSDate?
    var difficulty: Int?
    var isMust: Bool?
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
        isMust <- map["is_must"]
        failureAt <- map["failure_at"]
        userID <- map["user_id"]
        doneAt <- map["done_at"]
    }
}