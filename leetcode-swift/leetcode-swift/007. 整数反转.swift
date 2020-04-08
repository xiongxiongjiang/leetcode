//
//  007. 整数反转.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:

 输入: 123
 输出: 321
  示例 2:

 输入: -123
 输出: -321
 示例 3:

 输入: 120
 输出: 21
 注意:

 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2的31次方,  2的31次方 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 */

extension Solution {
    func reverse(_ x: Int) -> Int {
        var isMinus = false
        var str = "\(x)"
        if x < 0 {
            isMinus = true
            str.removeFirst()
        }
        str = String(str.reversed())
        while str.hasPrefix("0") {
            str.removeFirst()
        }
        if isMinus == true {
            str = "-" + str
        }
        let num = Int(str) ?? 0
        if num < Int32.min || num > Int32.max {
            return 0
        }
        return num
    }
}

func test007(s: Solution) {
    print(s.reverse(123))
}

