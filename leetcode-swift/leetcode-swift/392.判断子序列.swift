//
//  392.判断子序列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/9/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*

 给定字符串 s 和 t ，判断 s 是否为 t 的子序列。

 你可以认为 s 和 t 中仅包含英文小写字母。字符串 t 可能会很长（长度 ~= 500,000），而 s 是个短字符串（长度 <=100）。

 字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。

 示例 1:
 s = "abc", t = "ahbgdc"
 返回 true.

 示例 2:
 s = "axc", t = "ahbgdc"
 返回 false.

 后续挑战 :
 如果有大量输入的 S，称作S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？
 */

extension Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sArr = Array(s)
        let tArr = Array(t)
        let n = sArr.count, m = tArr.count
        var i = 0, j = 0
        while i < n && j < m {
            if sArr[i] == tArr[j] {
                i += 1
                j += 1
            } else {
                j += 1
            }
        }
        return i == n
    }
    
    func isSubsequence2(_ s: String, _ t: String) -> Bool {
        let n = s.count
        if n == 0 {
            return true
        }
        let m = t.count
        if m == 0 && n != 0 {
            return false
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        let arr1 = Array(s)
        let arr2 = Array(t)
        for i in 1...n {
            for j in 1...m {
                if arr2[j-1] == arr1[i-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[n][m] == n
    }
}
