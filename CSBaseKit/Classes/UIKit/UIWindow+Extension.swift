//
//  UIWindow+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/3/8.
//

import Foundation

extension UIWindow {
    
    // 获取当前显示的controller
    func visibleViewController() -> UIViewController? {
        return getVisibleViewControllerFrom(rootViewController)
    }
    
    // 获取当前显示的controller
    func getVisibleViewControllerFrom(_ controller : UIViewController?) -> UIViewController? {
        
        guard let vc = controller else { return controller }
        
        if vc.isKind(of: UINavigationController.self) {
            return getVisibleViewControllerFrom((vc as? UINavigationController)?.visibleViewController)
        } else if vc.isKind(of: UITabBarController.self) {
            return getVisibleViewControllerFrom((vc as? UITabBarController)?.selectedViewController)
        } else {
            guard let presentationController = vc.presentedViewController else { return vc }
            return getVisibleViewControllerFrom(presentationController)
        }
    }
}
