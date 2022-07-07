//
//  009. 回文数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:

 输入: 121
 输出: true
 示例 2:

 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3:

 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 进阶:

 你能不将整数转为字符串来解决这个问题吗？
 */


extension Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var res = 0
        if x < 0 {
            return false
        }
        var x1 = x
        while x1 != 0 {
            res = res * 10 + x1 % 10
            x1 /= 10
        }
        return res == x
    }

    func isPalindrome2(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var x1 = x
        var y = 0
        while x1 > y {
            y = y * 10 + x1 % 10
            x1 /= 10
        }
        return x1 == y || x1 == y / 10
    }
}

func test009(s: Solution) {
    print(s.isPalindrome(1001))
}
