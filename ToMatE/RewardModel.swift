//
//  RewardsModel.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import ObjectMapper

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
}