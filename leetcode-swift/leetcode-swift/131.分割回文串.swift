//
//  131.分割回文串.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/5/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。
 返回 s 所有可能的分割方案。

 示例:
 输入: "aab"
 输出:
 [
   ["aa","b"],
   ["a","a","b"]
 ]
 */

extension Solution {
    func partition(_ s: String) -> [[String]] {
        var res = [[String]]()
        var stack = [String]()
        partitionBackTrack(res: &res, stack: &stack, s: s, start: 0, count: s.count)
        return res
    }
    
    func partitionBackTrack(res: inout [[String]], stack: inout [String], s: String, start: Int, count: Int) {
        if start == count {
            res.append(stack)
            return
        }
        for i in start..<count {
            if checkPalindrome(s: s, start: start, end: i) == false {
                continue
            }
            stack.append(String(Array(s)[start..<i+1]))
            partitionBackTrack(res: &res, stack: &stack, s: s, start: i + 1, count: count)
            stack.removeLast()
        }
    }
    
    func checkPalindrome(s: String, start: Int, end: Int) -> Bool {
        var start = start
        var end = end
        while start < end {
            let chars = Array(s)
            if chars[start] != chars[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
    
}

func test131(s: Solution) {
    print(s.partition("aab"))
}
