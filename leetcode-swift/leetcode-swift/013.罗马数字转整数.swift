//
//  013.罗马数字转整数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/5/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

 示例 1:
 输入: "III"
 输出: 3
 
 示例 2:
 输入: "IV"
 输出: 4
 
 示例 3:
 输入: "IX"
 输出: 9
 
 示例 4:
 输入: "LVIII"
 输出: 58
 解释: L = 50, V= 5, III = 3.
 
 示例 5:
 输入: "MCMXCIV"
 输出: 1994
 解释: M = 1000, CM = 900, XC = 90, IV = 4.
 */

extension Solution {
    func romanToInt(_ s: String) -> Int {
        let count = s.count
        let map = ["I": 1,
                   "IV": 4,
                   "V": 5,
                   "IX": 9,
                   "X": 10,
                   "XL": 40,
                   "L": 50,
                   "XC": 90,
                   "C": 100,
                   "CD": 400,
                   "D": 500,
                   "CM": 900,
                   "M": 1000
        ]
        var i = 0
        var res = 0
        while i < count {
            let start = s.index(s.startIndex, offsetBy: i)
            var end = s.startIndex
            if i < count - 1 && map[String(s[start..<s.index(s.startIndex, offsetBy: i+2)])] != nil {
                if let curr = map[String(s[start..<s.index(s.startIndex, offsetBy: i+2)])] {
                    res += curr
                    i += 2
                }
            } else {
                end = s.index(s.startIndex, offsetBy: i+1)
                if let curr = map[String(s[start..<end])] {
                    res += curr
                }
                i += 1
            }
        }
        return res
    }
    
    func romanToInt1(_ s: String) -> Int {
        let map: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var res = 0
        var last = 0
        for sub in s {
            if let curr = map[sub] {
                res += curr
                if curr > last {
                    res -= last * 2
                }
                last = curr
            }
        }
        return res
    }
}


func test013(s: Solution) {
    print(s.romanToInt1("III"))
}
