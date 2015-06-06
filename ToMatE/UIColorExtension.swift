//
//  UIColorExtension.swift
//  ToMatE
//
//  Created by minami on 6/6/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func rgb(#r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    class func TMEMainColor() -> UIColor {
        return UIColor.rgb(r: 237, g: 161, b: 132, alpha: 1.0)
    }
    class func TMEBlueColor() -> UIColor {
        return UIColor.rgb(r: 45, g: 154, b: 208, alpha: 0.8)
    }
    class func TMEGreenColor() -> UIColor {
        return UIColor.rgb(r: 40, g: 177, b: 115, alpha: 0.8)
    }
    class func TMERedColor() -> UIColor {
        return UIColor.rgb(r: 221, g: 79, b: 98, alpha: 0.8)
    }
    
}