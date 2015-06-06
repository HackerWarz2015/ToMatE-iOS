//
//  WelcomeSignUpViewController.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class WelcomeSignUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let textFieldCellIdentifer = "welcomeSignUpCell"
    let iconCellIdentifer = "welcomeSignUpIconCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(textFieldCellIdentifer, forIndexPath: indexPath) as!WelcomeSignUpTableViewCell
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
    
}
