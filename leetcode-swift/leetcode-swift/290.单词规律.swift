//
//  290.单词规律.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/5/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。
 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。

 示例1:
 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 
 示例 2:
 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 
 示例 3:
 输入: pattern = "aaaa", str = "dog cat cat dog"
 输出: false
 
 示例 4:
 输入: pattern = "abba", str = "dog dog dog dog"
 输出: false
 
 说明:
 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。
 */

extension Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        var dict = [String: String.Element]()
        let patternArr = Array(pattern)
        let strArr = str.components(separatedBy: " ")
        if patternArr.count != strArr.count {
            return false
        }
        for i in 0..<strArr.count {
            let strP = strArr[i]
            let parrernStr = patternArr[i]
            if dict[strP] == nil {
                dict[strP] = parrernStr
            } else if dict[strP] == parrernStr {
                continue
            } else {
                return false
            }
        }
        return Set(patternArr).count == Set(strArr).count
    }
}

func test290(s: Solution) {
//    let pattern = "abba", str = "dog dog dog dog"
    let pattern = "aaa"
    let str = "aa aa aa aa"
    print(s.wordPattern(pattern, str))
}
