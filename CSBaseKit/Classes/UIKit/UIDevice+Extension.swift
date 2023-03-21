//
//  UIDevice+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/2/21.
//

import Foundation

public let SCREEN_WIDTH = UIDevice.current.screenWidth
public let SCREEN_HEIGHT = UIDevice.current.screenHeight
public let NAVBAR_HIGHT : CGFloat = UIDevice.current.navBarHeight
public let NAVBAR_FULL_HEIGHT : CGFloat = UIDevice.current.fullNavBarHeight
public let TABBAR_HEIGHT : CGFloat = UIDevice.current.tabBarHeight
public let TABBAR_FULL_HEIGHT : CGFloat = UIDevice.current.fullTabBarHeight
public let SAFEAREA_INSETS = UIDevice.current.safeAreaInsets

public extension UIDevice {
    
    /// 安全区域
    public var safeAreaInsets : UIEdgeInsets {
        var edgeInsets = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.currentKeyWindow
            edgeInsets = window.safeAreaInsets
        }
        return edgeInsets
    }
    
    /// 状态栏高度
    public var statusBarHeight : CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.currentKeyWindow
            statusBarHeight = window.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

    /// 导航栏高度
    public var navBarHeight : CGFloat {
        return 44.0
    }
    
    /// 导航栏高度
    public var fullNavBarHeight : CGFloat {
        return navBarHeight + statusBarHeight
    }
    
    /// 底部栏高度
    public var tabBarHeight : CGFloat {
        return 49.0
    }
    
    /// 导航栏高度
    public var fullTabBarHeight : CGFloat {
        return tabBarHeight + 34.0
    }
    
    /// 设备宽度
    public var screenWidth : CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    /// 设备高度
    public var screenHeight : CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    /// 判断是否iPhone
    public var isiPad : Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
