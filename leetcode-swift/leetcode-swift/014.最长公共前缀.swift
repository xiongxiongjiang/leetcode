//
//  014. 最长公共前缀.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

 示例 1:

 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:

 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:

 所有输入只包含小写字母 a-z 。
 */

extension Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        var first = strs.first!
        for i in 0..<strs.count {
            let str = strs[i]
            while str.hasPrefix(first) == false {
                first.removeLast()
                if first == "" {
                    return ""
                }
            }
        }
        return first
    }
}

func test014(s: Solution) {
    let strs = ["flower", "flow", "flight"]
    print(s.longestCommonPrefix(strs))
}
