//
//  020. 有效的括号.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:
 输入: "()"
 输出: true
 
 示例 2:
 输入: "()[]{}"
 输出: true
 
 示例 3:
 输入: "(]"
 输出: false
 
 示例 4:
 输入: "([)]"
 输出: false
 
 示例 5:
 输入: "{[]}"
 输出: true
 */

extension Solution {
    func isValid(_ s: String) -> Bool {
       var cArr = [Character]()
       for c in s {
           switch c {
           case "{","[","(":
               cArr.append(c)
           case "}":
               guard (!cArr.isEmpty && cArr.removeLast() == "{") else {
                   return false
               }
           case "]":
               guard (!cArr.isEmpty && cArr.removeLast() == "[") else {
                   return false
               }
           case ")":
               guard (!cArr.isEmpty && cArr.removeLast() == "(") else {
                   return false
               }
           default: break
           }
       }
       return cArr.isEmpty
    }
}

func test020(s: Solution) {
    let str = "[]{}"
    print(s.isValid(str))
}
