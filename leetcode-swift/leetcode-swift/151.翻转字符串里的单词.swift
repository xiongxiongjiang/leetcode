//
//  151.翻转字符串里的单词.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/5/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个字符串，逐个翻转字符串中的每个单词。

 示例 1：
 输入: "the sky is blue"
 输出: "blue is sky the"
 
 示例 2：
 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 
 示例 3：
 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
  
 说明：
 无空格字符构成一个单词。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 */

extension Solution {
    func reverseWords(_ s: String) -> String {
        let arr = s.components(separatedBy: " ")
        var res = ""
        for str in arr {
            if str != "" {
                res = str + " " + res
            }
        }
        if let last = res.last {
            if String(last) == " " {
                res.removeLast()
            }
        }
        return res
    }
}

func test151(s: Solution) {
    let str = "  hello world!  "
    print(s.reverseWords(str))
}
