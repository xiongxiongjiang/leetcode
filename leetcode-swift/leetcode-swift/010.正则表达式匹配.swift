//
//  010.正则表达式匹配.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/9/4.
//  Copyright © 2020 xurong. All rights dperved.
//

import Foundation

/*
 给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。

 '.' 匹配任意单个字符
 '*' 匹配零个或多个前面的那一个元素
 
 所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。

 说明:
 s 可能为空，且只包含从 a-z 的小写字母。
 p 可能为空，且只包含从 a-z 的小写字母，以及字符 . 和 *。
 
 示例 1:
 输入:
 s = "aa"
 p = "a"
 输出: false
 解释: "a" 无法匹配 "aa" 整个字符串。
 
 示例 2:
 输入:
 s = "aa"
 p = "a*"
 输出: true
 解释: 因为 '*' 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 'a'。因此，字符串 "aa" 可被视为 'a' 重复了一次。
 
 示例 3:
 输入:
 s = "ab"
 p = ".*"
 输出: true
 解释: ".*" 表示可匹配零个或多个（'*'）任意字符（'.'）。
 
 示例 4:
 输入:
 s = "aab"
 p = "c*a*b"
 输出: true
 解释: 因为 '*' 表示零个或多个，这里 'c' 为 0 个, 'a' 被重复一次。因此可以匹配字符串 "aab"。
 
 示例 5:
 输入:
 s = "mississippi"
 p = "mis*is*p*."
 输出: false
 */

extension Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s), p = Array(p)
        let n = s.count, m = p.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: m+1), count: n+1)
        dp[0][0] = true
        for i in 0..<m {
            //一个*号可以把之前的一个字母抵消掉，所以i+1为*时。取决于i-1
            if p[i] == "*" {
                dp[0][i + 1] = dp[0][i - 1]
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                if i == 1 {
                    print(1)
                }
                if p[j] != "*" {
                    if dp[i][j] {
                        if p[j] == "." || p[j] == s[i] {
                            dp[i + 1][j + 1] = true
                        }
                    }
                } else {
                    if dp[i + 1][j - 1] {
                        dp[i + 1][j + 1] = true
                    } else if dp[i][j - 1] || dp[i][j + 1] {
                        if p[j - 1] == s[i] || p[j - 1] == "."   {
                            dp[i + 1][j + 1] = true
                        }
                    }
                }
            }
        }
        return dp[n][m]
    }
}

func test010(s: Solution) {
    let a = "aab"
    let b = "c*a*b"
//    let a = "mississippi"
//    let b = "mis*is*p*."
    print(s.isMatch(a, b))
}
