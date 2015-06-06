//
//  RewardsModel.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import ObjectMapper

class GETRewardsResponse: Mappable {

    var rewards: [Reward]?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        rewards <- map["rewards"]
    }

}

class PUTRewardResponse: Mappable {

    var reward: Reward?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        reward <- map["rewards"]
    }

}


class Reward: Mappable {

    var title: String?
    var isShare: Bool?
    var isPublic: Bool?

    init() {}

    required init?(_ map: Map) {
        mapping(map)
    }

    func mapping(map: Map) {
        title <- map["title"]
        isShare <- map["is_share"]
        isPublic <- map["is_public"]
    }

    class func getCreateRewardParams(title: String, isPublic: Bool) -> [String: AnyObject] {
        return ["title": title, "is_public": isPublic]
    }

    class func getUpdateRewardParams(status: String, title: String, isPublic: Bool) -> [String: AnyObject] {
        return ["status": status, "title": title, "is_public": isPublic]
    }

}