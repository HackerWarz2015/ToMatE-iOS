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
    private var id: Int?

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

    func getId() -> Int? {
        return self.id
    }

    func setId(id: Int) {
        self.id = id
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
    func repossessionAuthenticationToken() {

        let oldToken = token
        Alamofire.request(.POST, String(Constant.API_ROOT + "users/sign_in.json"), parameters: User.getAuthenticationParams(email ?? "", password: password ?? ""))
        .responseObject { (response: User?, error: NSError?) in
            if error != nil {
                return
            }

            if let user = response {

                self.name = user.name
                self.email = user.email
                self.token = user.token
                let ud = NSUserDefaults.standardUserDefaults()
                ud.setObject(self.name, forKey: "name")
                ud.setObject(self.email, forKey: "email")
                ud.setObject(self.password, forKey: "pass")
                ud.setObject(self.token, forKey: "token")
                ud.setBool(true, forKey: "loggedIn")
                ud.synchronize()
                (UIApplication.sharedApplication().delegate as! AppDelegate).loggedIn()
            }
        }
    }

    func logout() {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "loggedIn")
        (UIApplication.sharedApplication().delegate as! AppDelegate).loggedOut()
    }

    func login() {
        repossessionAuthenticationToken()

    }


}
