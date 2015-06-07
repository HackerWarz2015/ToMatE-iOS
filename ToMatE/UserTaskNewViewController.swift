//
//  UserTaskNewViewController.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class UserTaskNewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var sliderValue:Float = 1
    
    var datePicker:UIDatePicker = UIDatePicker()
    
    let textFieldCellIdentifer = "userTaskNewTextFieldCell"
    let labelCellIdentifer = "userTaskNewLabelCell"
    let sliderCellIdentifer = "userTaskNewSliderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.frame = CGRectMake(0, self.view.frame.size.height, datePicker.frame.size.width, datePicker.frame.size.height)
        datePicker.timeZone = NSTimeZone.localTimeZone()
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.addTarget(self, action: "didChangeDatePicker:", forControlEvents: UIControlEvents.ValueChanged)
        datePicker.datePickerMode = UIDatePickerMode.Date
        self.view.addSubview(datePicker)
        

    }
    
    override func viewDidAppear(animated: Bool) {
        let textField = self.view.viewWithTag(1) as! UITextField
        textField.delegate = self
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didTapLimitLabel:")
        let limitLabel = self.view.viewWithTag(2) as! UILabel
        NSLog("limitlabel:%@", limitLabel)
        limitLabel.addGestureRecognizer(tapGesture)
        
        let slider = self.view.viewWithTag(3) as! UISlider
        slider.addTarget(self, action: "sliderChanging:", forControlEvents: UIControlEvents.ValueChanged)
    }
     

    //MARK: - TableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier(textFieldCellIdentifer, forIndexPath: indexPath) as! TextFieldTableViewCell
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier(labelCellIdentifer, forIndexPath: indexPath) as! LabelTableViewCell
        case 2:
            cell = tableView.dequeueReusableCellWithIdentifier(sliderCellIdentifer, forIndexPath: indexPath) as! SliderTableViewCell
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
            return "期日"
        case 2:
            return "重要度"
        default:
            return ""
        }
    }
    
    
    //MARK: -DatePicker
    func didChangeDatePicker(sender : UIDatePicker) {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        let titleLabel = self.view.viewWithTag(2) as? UILabel
        titleLabel?.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func openDatePicker() {
        UIView.animateWithDuration(0.5, animations: {
            self.datePicker.frame = CGRectMake(0, self.view.frame.size.height - self.datePicker.frame.size.height-60, self.datePicker.frame.size.width, self.datePicker.frame.size.height)
        })
    }
    func closeDatePicker() {
        UIView.animateWithDuration(0.5, animations: {
            self.datePicker.frame = CGRectMake(0, self.view.frame.size.height, self.datePicker.frame.size.width, self.datePicker.frame.size.height)
        })
        
    }
    
    
    //MARK: - TextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        closeDatePicker()
        return true
    }
    
    //MARK: -Slider
    func sliderChanging(sender : UISlider) {
        sender.value = round(sender.value)
        sliderValue = sender.value
    }

  
    func didTapLimitLabel(sender: AnyObject) {
        openDatePicker()
        self.view.endEditing(true)
    }
    
    //MARK: - Other
    @IBAction func didTapAddButton(sender: AnyObject) {
        let title = (self.view.viewWithTag(1) as? UITextField)?.text
        let limit = (self.view.viewWithTag(2) as? UILabel)?.text
        let importance = sliderValue



        Alamofire.request(.POST, String(Constant.API_ROOT + Constant.API_PREFIX + "users/\(LoggedInUser.currentUser.getId()!)/user_tasks?token=" + LoggedInUser.currentUser.getToken()!), parameters: UserTask.getCreateUserTaskParams(title!, difficulty: Int(importance*2+1), steps: Int(importance*2+1), limit: limit!))
            .responseObject{ (response: POSTUserTaskResponse?, error: NSError?) in
                println(response?.userTask)
                println(error)
                if error != nil {
                    return
                }

                if let userTasks = response?.userTask {

                }
        }

        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        self.view.endEditing(true)
        closeDatePicker()
    }
    
    
}
