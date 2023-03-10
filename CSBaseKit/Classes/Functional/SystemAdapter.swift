//
//  CSSystemAdapter.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/3/10.
//

import Foundation

public class SystemAdapter {
    
    // 适配不同系统
    public static func adaptation(){
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        UITableView.appearance().estimatedSectionFooterHeight = 0
        UITableView.appearance().estimatedSectionHeaderHeight = 0
        
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0;
        }
    }
}
