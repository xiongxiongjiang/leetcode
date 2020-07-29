//
//  1143.最长公共子序列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定两个字符串 text1 和 text2，返回这两个字符串的最长公共子序列的长度。

 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。两个字符串的「公共子序列」是这两个字符串所共同拥有的子序列。

 若这两个字符串没有公共子序列，则返回 0。

 示例 1:
 输入：text1 = "abcde", text2 = "ace"
 输出：3
 解释：最长公共子序列是 "ace"，它的长度为 3。
 
 示例 2:
 输入：text1 = "abc", text2 = "abc"
 输出：3
 解释：最长公共子序列是 "abc"，它的长度为 3。
 
 示例 3:
 输入：text1 = "abc", text2 = "def"
 输出：0
 解释：两个字符串没有公共子序列，返回 0。
  
 提示:
 1 <= text1.length <= 1000
 1 <= text2.length <= 1000
 输入的字符串只含有小写英文字符。
 */

extension Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let n = text1.count
        let m = text2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        let arr1 = Array(text1)
        let arr2 = Array(text2)
        for i in 1...n {
            for j in 1...m {
                if arr2[j-1] == arr1[i-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[n][m]
    }
}

func test1143(s: Solution) {
    let text1 = "abcde", text2 = "ace"
    print(s.longestCommonSubsequence(text1, text2))
}
