//
//  OutlineUILabel.swift
//  ToMatE
//
//  Created by minami on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class OutlineUILabel: UILabel {

    var outlineColor:UIColor
    var outlineSize:CGFloat

    
    required init(coder aDecoder: NSCoder) {
        outlineColor = UIColor.whiteColor()
        outlineSize = 2
        super.init(coder: aDecoder)
    }
    
    override func drawTextInRect(rect: CGRect) {
        let cr = UIGraphicsGetCurrentContext()
        let textColor = self.textColor;
        
        CGContextSetLineWidth(cr, outlineSize)
        CGContextSetLineJoin(cr, kCGLineJoinRound)
        CGContextSetTextDrawingMode(cr, kCGTextStroke)
        self.textColor = outlineColor
        super.drawTextInRect(rect)
        
        CGContextSetTextDrawingMode(cr, kCGTextFill)
        self.textColor = textColor
        super.drawTextInRect(rect)
        
    }
    
  
}
