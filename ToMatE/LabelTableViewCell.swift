//
//  LabelTableViewCell.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        label.text = dateFormatter.stringFromDate(NSDate())
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
