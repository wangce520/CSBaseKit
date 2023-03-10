//
//  UIWindow+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/2/21.
//

import Foundation

public extension UIApplication {
    
    // 获取当前的window
    var currentKeyWindow : UIWindow {
        let window = windows.filter {$0.isKeyWindow}.first!
        return window
    }
    
}
