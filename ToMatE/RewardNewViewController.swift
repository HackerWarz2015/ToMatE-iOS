//
//  RewardNewViewController.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class RewardNewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

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
        let cell = tableView.dequeueReusableCellWithIdentifier("rewardNewCell", forIndexPath: indexPath) as! RewardNewTableViewCell
        cell.textField.tag = indexPath.section + 1
        switch indexPath.section {
        case 0:
            cell.textField.keyboardType = UIKeyboardType.Default
            cell.textField.placeholder = "ごほうびを入力してください"
        case 1:
            cell.textField.keyboardType = UIKeyboardType.NumberPad
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "設定歩数"
        default:
            return ""
        }
    }
    
    //MARK:-TextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func didTapAddButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        let title = (self.view.viewWithTag(1) as? UITextField)?.text
        let step = (self.view.viewWithTag(2) as? UITextField)?.text
        NSLog("address:%@,pass:%@", title!,step!)
        
        
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
}
