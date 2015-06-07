//
//  SliderTableViewCell.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    var value:Float = 1
    @IBOutlet weak var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

   }