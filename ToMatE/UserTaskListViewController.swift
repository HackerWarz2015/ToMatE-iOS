//
//  UserTaskListViewController.swift
//  ToMatE
//
//  Created by minami on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class UserTaskListViewController: UITableViewController,UITableViewDelegate,UITableViewDataSource {

    
    let cellIdentifer = "userTaskListCell"
    var isOpenSections:[Int:Bool] = [Int():true]

    var dividedData: ([UserTask], [UserTask]) = ([], [])

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "目標"
    }

    override func viewWillAppear(animated: Bool) {
        fetchRemoteData()
    }

    func fetchRemoteData() {
        Alamofire.request(.GET, String(Constant.API_ROOT + Constant.API_PREFIX + "users/\(LoggedInUser.currentUser.getId()!)/user_tasks"), parameters: ["token": LoggedInUser.currentUser.getToken()!])
            .responseObject{ (response: GETUserTasksResponse?, error: NSError?) in
                if error != nil {
                    return
                }

                if let userTasks = response?.userTasks {
                    self.dividedData = self.sortOutDoneFromUncompleted(userTasks)
                    self.tableView.reloadData()
            }
        }
    }

    func sortOutDoneFromUncompleted(userTasks: [UserTask]) -> ([UserTask], [UserTask]) {
        var tupple: ([UserTask], [UserTask]) = ([], [])
        println(userTasks)
        for task in userTasks {
            if task.doneAt != nil {
                tupple.1.append(task)
            } else {
                tupple.0.append(task)
            }
        }

        return tupple
    }

    // MARK: - TableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return dividedData.0.count
            case 1:
                return dividedData.1.count
            default:
                return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! UserTaskListCustomTableViewCell
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        let today = NSDate()
        let cal = NSCalendar.currentCalendar()


        switch indexPath.section {
            case 0:
                cell.stepLabel.text = String(dividedData.0[indexPath.row].steps!)
                cell.titleLabel.text = dividedData.0[indexPath.row].title
                if let limit = dividedData.0[indexPath.row].limitDate {
                    cell.limitDayLabel.text = dateFormatter.stringFromDate(dividedData.0[indexPath.row].limitDate!)
                    let dateComp = cal.components(NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay, fromDate: dividedData.0[indexPath.row].limitDate!, toDate: today, options: NSCalendarOptions.MatchFirst)
                    cell.limitCountLabel.text = String(dateComp.month) + String(dateComp.day)
                } else {
                    cell.limitDayLabel.text = "2015年06月07日"
                    cell.limitCountLabel.text = ""
                }
                switch  dividedData.0[indexPath.row].difficulty! {
                    case 0:
                        cell.iconView.backgroundColor = UIColor.TMEBlueColor()
                    case 1:
                        cell.iconView.backgroundColor = UIColor.TMEGreenColor()
                    case 2:
                        cell.iconView.backgroundColor = UIColor.TMERedColor()
                    default:
                        break
            }
            

            case 1:
                cell.stepLabel.text = String(dividedData.1[indexPath.row].steps!)
                cell.titleLabel.text = dividedData.1[indexPath.row].title
                cell.limitView.hidden = true
            default: break
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
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        let doneAction = UITableViewRowAction(style: .Normal, title: "done"){ (action, indexPath) in
            if indexPath.section == 0 {
                self.doneUserTask(indexPath)
            }
        }
        doneAction.backgroundColor = UIColor.TMEGreenColor()
        return [doneAction]
    }
    
    func doneUserTask(indexPath : NSIndexPath) {
        let task = dividedData.0[indexPath.row]
        dividedData.0.removeAtIndex(indexPath.row)
        dividedData.1.append(task)
        println(dividedData.0)
        println(dividedData.1)
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView,commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath) {
            
    }
}