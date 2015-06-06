//
//  LoggedInUser.swift
//  ToMatE
//
//  Created by IllyasvielVonEinzbern on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class LoggedInUser {

    static let currentUser = LoggedInUser()
    private var name: String?
    private var password: String?
    private var token: String?
    private var image: UIImage?
    private var imageURL: String?
    private var email: String?

    private init() {}

    //MARK: getter and setter
    func getName() -> String? {
        return LoggedInUser.currentUser.name
    }

    func setName(name: String) {
        self.name = name
    }

    func getPassword() -> String? {
        return self.password
    }

    func setPassword(password: String) {
        self.password = password
    }

    func getToken() -> String? {
        return self.token
    }

    func setToken(token: String) {
        self.token = token
    }

    func setEmail(email: String) {
        self.email = email
    }

    func getEmail() -> String? {
        return self.email
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

    //MARK: api
    func repossessionAuthenticationToken() -> Bool {
        let semaphore = dispatch_semaphore_create(0)
        let oldToken = token
        Alamofire.request(.GET, Constant.API_ROOT + "users/sign_in", parameters: User.getAuthenticationParams(email ?? "", password: password ?? ""), encoding: .JSON)
        .responseObject { (response: SHOWUserResponse?, error: NSError?) in
            if let userResponse = response {
                self.token = userResponse.user?.token
                dispatch_semaphore_signal(semaphore)
            }
        }
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return token != oldToken
    }

}
