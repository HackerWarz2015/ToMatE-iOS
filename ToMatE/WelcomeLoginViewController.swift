//
//  WelcomeLoginViewController.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class WelcomeLoginViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    let cellIdentifer = "welcomeLoginCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! TextFieldTableViewCell
        cell.textField.tag = indexPath.section + 1
        switch indexPath.section {
        case 0:
            cell.textField.keyboardType = UIKeyboardType.EmailAddress
        case 1:
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
            return "メールアドレス"
        case 1:
            return "パスワード"
        default:
            return ""
        }
    }

    //MARK:-TextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func didTapLoginButton(sender: AnyObject) {
        let viewController:UITabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarController") as! UITabBarController

        let address = (self.view.viewWithTag(1) as? UITextField)?.text
        let pass = (self.view.viewWithTag(2) as? UITextField)?.text

        LoggedInUser.currentUser.setEmail(address ?? "")
        LoggedInUser.currentUser.setPassword(pass ?? "")
        LoggedInUser.currentUser.repossessionAuthenticationToken()

        
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
}
