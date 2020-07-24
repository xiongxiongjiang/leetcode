//
//  186.翻转字符串里的单词II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/23.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个字符串，逐个翻转字符串中的每个单词。

 示例：
 输入: ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
 输出: ["b","l","u","e"," ","i","s"," ","s","k","y"," ","t","h","e"]
 
 注意：
 单词的定义是不包含空格的一系列字符
 输入字符串中不会包含前置或尾随的空格
 单词与单词之间永远是以单个空格隔开的
 进阶：使用 O(1) 额外空间复杂度的原地解法。
 */

extension Solution {
    func reverseWords(_ s: inout [Character]) {
        s = s.reversed()
        var i = 0, j = 0, count = s.count
        while i < count {
            while j < count && s[j] != Character(" ") {
                j += 1
            }
            reverseArr(&s, i, j-1)
            j += 1
            i = j
        }
        print(s)
    }
    
    func reverseArr(_ s: inout [Character], _ i: Int, _ j: Int) {
        var start = i, end = j
        while start < end {
            s.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

func test186(s: Solution) {
    var arr: [Character] = ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
    s.reverseWords(&arr)
}
