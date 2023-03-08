//
//  UIColor+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/2/21.
//

import Foundation

extension AnyObject {
    
    // 对比两个对象地址是否相等
    func equalTo(_ object : AnyObject) -> Bool {
        let str1 = object.getMemoryAddress()
        let str2 = getMemoryAddress()
        return str1 == str2
    }

    // 获取对象地址
    func getMemoryAddress() -> String {
        let str = Unmanaged<AnyObject>.passUnretained(self).toOpaque()
        return String(describing: str)
    }
}
