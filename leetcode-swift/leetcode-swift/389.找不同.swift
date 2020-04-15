//
//  389.找不同.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

extension Solution {
    
    //低效写法，应该用字符串异或
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var charS = [Character]()
        var charT = [Character]()
        for c in s {
            charS.append(c)
        }
        for c in t {
            charT.append(c)
        }
        charS = charS.sorted(by: <)
        charT = charT.sorted(by: <)
        while charS.isEmpty == false {
            let a = charS.removeFirst()
            let b = charT.removeFirst()
            if a != b {
                return b
            }
        }
        return charT.first!
    }
}

func test389(s: Solution) {
    let a = "abcd"
    let b = "aecdb"
    print(s.findTheDifference(a, b))
}
