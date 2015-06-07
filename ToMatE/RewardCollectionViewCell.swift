//
//  RewardCollectionViewCell.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class RewardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var leftLine: UIView!
    @IBOutlet weak var rightLine: UIView!
    @IBOutlet weak var smallCircle: UIView!
    @IBOutlet weak var bigCircle: UIView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var stepImage: UIImageView!
    var step = 0
}
