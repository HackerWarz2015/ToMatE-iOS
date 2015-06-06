//
//  LoggedInUser.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class LoggedInUser {

    static let currentUser = LoggedInUser()
    private var name: String?
    private var password: String?
    private var token: String?
    private var image: UIImage?
    private var imageURL: String?

    private init() {

    }

    func getName() -> String? {
        return LoggedInUser.currentUser.name
    }

    func setName(name: String) {
        LoggedInUser.currentUser.name = name
    }

    func getPassword() -> String? {
        return LoggedInUser.currentUser.password
    }

    func setPassword(name: String) {
        LoggedInUser.currentUser.password = password
    }

    func getToken() -> String? {
        return LoggedInUser.currentUser.token
    }

    func setToken(token: String) {
        LoggedInUser.currentUser.token = token
    }

    func getImage() -> UIImage? {
        let url = NSURL(string: LoggedInUser.currentUser.imageURL ?? "")
        var err: NSError?
        var imageData :NSData = NSData(contentsOfURL: url!,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!
        return UIImage(data:imageData)
    }

    func setImageURL(url: String) {
        LoggedInUser.currentUser.imageURL = url
    }

}
