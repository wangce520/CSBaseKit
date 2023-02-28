//
//  UIDevice+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/2/21.
//

import Foundation

extension UIDevice {
    
    /// 安全区域
    var safeAreaInsets : UIEdgeInsets {
        var edgeInsets = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            edgeInsets = window?.safeAreaInsets ?? UIEdgeInsets.zero
        }
        return edgeInsets
    }
    
    /// 导航栏高度
    var statusBarHeight : CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

}
