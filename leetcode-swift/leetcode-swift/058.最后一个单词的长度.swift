//
//  058. 最后一个单词的长度.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 给定一个仅包含大小写字母和空格 ' ' 的字符串 s，返回其最后一个单词的长度。如果字符串从左向右滚动显示，那么最后一个单词就是最后出现的单词。

 如果不存在最后一个单词，请返回 0 。

 说明：一个单词是指仅由字母组成、不包含任何空格字符的 最大子字符串。

 示例:

 输入: "Hello World"
 输出: 5
 */

extension Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let arr = s.trimmingCharacters(in: .whitespaces)
                .components(separatedBy: " ")
                .filter { $0 != "" }
        return arr.last?.count ?? 0
    }
}

func test058(s: Solution) {
    let str = "b   a    "
    print(s.lengthOfLastWord(str))
}

class Solution58 {
    func lengthOfLastWord(_ s: String) -> Int {
        var res = 0
        var isStart = true
        for char in s.reversed() {
            if char == " " {
                if !isStart {
                    return res
                }
            } else {
                isStart = false
                res += 1
            }
        }
        return res
    }
}
