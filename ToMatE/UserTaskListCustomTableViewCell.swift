//
//  UserTaskListCustomTableViewCell.swift
//  ToMatE
//
//  Created by minami on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class UserTaskListCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var stepLabel: UILabel!
    
    @IBOutlet weak var iconLeftView: UIView!
    @IBOutlet weak var iconCenterView: UIView!
    @IBOutlet weak var iconRightView: UIView!
    
    @IBOutlet weak var titleLabel: OutlineUILabel!
    
    @IBOutlet weak var limitDayLabel: PaddingUILabel!
    @IBOutlet weak var limitCountLabel: PaddingUILabel!
    @IBOutlet weak var limitView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = iconView.frame.size.height/2
        iconLeftView.layer.cornerRadius = iconLeftView.frame.size.height/2
        iconCenterView.layer.cornerRadius = iconCenterView.frame.size.height/2
        iconRightView.layer.cornerRadius = iconRightView.frame.size.height/2
        
        
        titleLabel.outlineColor = UIColor.darkGrayColor()
        titleLabel.outlineSize = 0.05
    }
    
    func iconViewBackGroundColor(color:UIColor) {
        iconView.backgroundColor = color
        iconLeftView.backgroundColor = color
        iconCenterView.backgroundColor = color
        iconRightView.backgroundColor = color
    }

}
