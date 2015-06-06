//
//  UserTaskListViewController.swift
//  ToMatE
//
//  Created by minami on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class UserTaskListViewController: UITableViewController,UITableViewDelegate,UITableViewDataSource {

    let cellIdentifer = "userTaskListCell"
    var isOpenSections:[Int:Bool] = [Int():true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "目標"
    }

    // MARK: - TableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1:
            return 5
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! UserTaskListCustomTableViewCell
    
        switch indexPath.row%3 {
        case 0:
            cell.iconViewBackGroundColor(UIColor.TMEBlueColor())
            cell.stepLabel.text = "1"
            cell.titleLabel.text = "機械学習レポート"
            cell.limitCountLabel.text = "あと123日"
            cell.limitDayLabel.text = "2015.1.5"
            
        case 1:
            cell.iconViewBackGroundColor(UIColor.TMEGreenColor())
            cell.stepLabel.text = "3"
            cell.titleLabel.text = "アプリ開発"
            cell.limitCountLabel.text = "あと10日"
            cell.limitDayLabel.text = "2015.2.28"
            
            
        case 2:
            cell.iconViewBackGroundColor(UIColor.TMERedColor())
            cell.stepLabel.text = "5"
            cell.titleLabel.text = "お買い物"
            cell.limitCountLabel.text = "あと1234日"
            cell.limitDayLabel.text = "2015.12.28"
            
            
        default:
            break 
        }
        
        return cell
    }
 
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.new()
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(13)
        label.backgroundColor = UIColor.rgb(r: 235, g: 235, b: 235, alpha: 1.0)
        switch section {
        case 0:
            label.text = "   未完了"
        case 1:
            label.text = "   完了"
        default:
            break
        }
        return label
    }

}
