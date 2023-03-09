//
//  UIColor+Extension.swift
//  CSBaseKit
//
//  Created by ce.wang on 2023/2/21.
//

import Foundation

class ObjectHelper {
    
    // 对比两个对象地址是否相等
    static func equatableAnyObject(_ object1 : AnyObject, _ object2 : AnyObject) -> Bool {
        let str1 = getAnyObjectMemoryAddress(object1)
        let str2 = getAnyObjectMemoryAddress(object2)
        return str1 == str2
    }

    // 获取对象地址
    static func getAnyObjectMemoryAddress(_ object : AnyObject) -> String {
        let str = Unmanaged<AnyObject>.passUnretained(object).toOpaque()
        return String(describing: str)
    }

}


