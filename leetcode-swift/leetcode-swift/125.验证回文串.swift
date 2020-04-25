//
//  125.验证回文串.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/25.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 说明：本题中，我们将空字符串定义为有效的回文串。

 示例 1:
 输入: "A man, a plan, a canal: Panama"
 输出: true
 
 示例 2:
 输入: "race a car"
 输出: false
 */

extension Solution {
    func isPalindrome(_ s: String) -> Bool {
        let count = s.count
        var start = 0
        var end = count - 1
        let chars = "a"..."z"
        let nums = "0"..."9"
        let arr = s.map { (char) -> String in
            let str = String(char.lowercased())
            if chars.contains(str) || nums.contains(str) {
                return str
            }
            return ""
        }
        while start < end {
            let left = arr[start]
            let right = arr[end]
            if left == "" {
                start += 1
                continue
            }
            if right == "" {
                end -= 1
                continue
            }
            if left == right {
                start += 1
                end -= 1
            } else {
                return false
            }
        }
        return true
    }
}

func test125(s: Solution) {
//    let str = "A man, a plan, a canal: Panama"
    let str = "race a car"
    print(s.isPalindrome(str))
}
