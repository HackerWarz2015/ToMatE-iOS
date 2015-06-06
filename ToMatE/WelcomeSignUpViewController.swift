//
//  WelcomeSignUpViewController.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class WelcomeSignUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    let textFieldCellIdentifer = "welcomeSignUpCell"
    let iconCellIdentifer = "welcomeSignUpIconCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "アカウント登録"
        // Do any additional setup after loading the view.
    }
    
    //MARK: - TableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(textFieldCellIdentifer, forIndexPath: indexPath) as!WelcomeSignUpTableViewCell
        cell.textField.tag = indexPath.section + 1
        switch indexPath.section {
        case 0:
               cell.textField.keyboardType = UIKeyboardType.Default
        case 1:
            cell.textField.keyboardType = UIKeyboardType.EmailAddress
        case 2,3:
            cell.textField.keyboardType = UIKeyboardType.ASCIICapable
            cell.textField.secureTextEntry = true
        default:
            break
        }

        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "名前"
        case 1:
            return "メールアドレス"
        case 2:
            return "パスワード"
        case 3:
            return "パスワードの確認"
        default:
            return ""
        }
    }
    
    //MARK: - TextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    //MARK: - Other
    @IBAction func didTapSignUpButton(sender: AnyObject) {
        let viewController:UITabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarController") as! UITabBarController

        var errorMessage: String = ""

        if (self.view.viewWithTag(1) as? UITextField)?.text == "" {
            errorMessage += "アカウント名が入力されていないようです\n"
        }

        if (self.view.viewWithTag(2) as? UITextField)?.text  == "" {
            errorMessage += "メールアドレスが入力されていないようです\n"
        }

        if (self.view.viewWithTag(3) as? UITextField)?.text ==  "" {
            errorMessage += "パスワードが入力されていないようです\n"
        }

        if (self.view.viewWithTag(4) as? UITextField)?.text ==  "" {
            errorMessage += "パスワード確認が入力されていないようです\n"
        }

        let name = (self.view.viewWithTag(1) as? UITextField)?.text
        let address = (self.view.viewWithTag(2) as? UITextField)?.text
        let pass0 = (self.view.viewWithTag(3) as? UITextField)?.text
        let pass1 = (self.view.viewWithTag(4) as? UITextField)?.text

        if (pass0 != pass1) {
            errorMessage += "パスワードとパスワード確認が一致しません。"
        }

        if errorMessage != "" {
            showAlert(errorMessage)
            return
        }

        Alamofire.request(.GET, Constant.API_ROOT + "users/", parameters: User.getCreateUserParams(name!, email: address!, password: pass0!, passwordConf: pass1!), encoding: .JSON)
            .responseObject { (response: SHOWUserResponse?, error: NSError?) in
                if let userResponse = response {
                    LoggedInUser.currentUser.setName((userResponse.user?.name)!)
                    LoggedInUser.currentUser.setPassword((userResponse.user?.password)!)
                    LoggedInUser.currentUser.setEmail((userResponse.user?.email)!)
                    if LoggedInUser.currentUser.repossessionAuthenticationToken() {
                        self.presentViewController(viewController, animated: true, completion: nil)
                    }
                }
        }
    }

    @IBAction func didTapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }

    func showAlert(message: String!) {
        var alert = UIAlertView()
        alert.title = "確認"
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
    }

}
