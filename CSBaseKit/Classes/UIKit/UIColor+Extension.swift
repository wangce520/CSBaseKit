//
//  UIColor+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/2/21.
//

import Foundation

extension UIColor {
    
    /// 随机色
    class func random() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)/255), green: CGFloat(arc4random_uniform(256)/255), blue: CGFloat(arc4random_uniform(256)/255), alpha: 1.0)
    }
    
    /// 16进制颜色值转UIColor
    /// - Parameter string: 比如#FF9900
    convenience init(string: String) {
        let string = string.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: string)
         
        if string.hasPrefix("#") {
            scanner.scanLocation = 1
        }
         
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
         
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
         
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
         
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

