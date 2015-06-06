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
    
    @IBOutlet weak var titleLabel: OutlineUILabel!
    
    @IBOutlet weak var limitDayLabel: PaddingUILabel!
    @IBOutlet weak var limitCountLabel: PaddingUILabel!
    @IBOutlet weak var limitView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = iconView.frame.size.height/2
    
        titleLabel.outlineColor = UIColor.darkGrayColor()
        titleLabel.outlineSize = 0.05
        
        let selectedBackground = UIView()
        selectedBackground.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.selectedBackgroundView = selectedBackground
    }
    
    
}
