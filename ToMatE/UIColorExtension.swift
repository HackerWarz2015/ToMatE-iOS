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
        return UIColor.rgb(r: 65, g: 174, b: 228, alpha: 1.0)
    }
    class func TMEGreenColor() -> UIColor {
        return UIColor.rgb(r: 60, g: 197, b: 135, alpha: 1.0)
    }
    class func TMERedColor() -> UIColor {
        return UIColor.rgb(r: 241, g: 99, b: 128, alpha: 1.0)
    }
    
}