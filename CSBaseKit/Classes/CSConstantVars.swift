//
//  UIColor+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/2/21.
//

import Foundation

/// 输出Debug信息
func print_log<T>(_ message:T, file: String = #file, line: Int = #line) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)]: \(message)")
    #endif
}

