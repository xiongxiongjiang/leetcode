//
//  072.编辑距离.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/16.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。

 你可以对一个单词进行如下三种操作：

 插入一个字符
 删除一个字符
 替换一个字符
  

 示例 1：
 输入：word1 = "horse", word2 = "ros"
 输出：3
 解释：
 horse -> rorse (将 'h' 替换为 'r')
 rorse -> rose (删除 'r')
 rose -> ros (删除 'e')
 
 示例 2：
 输入：word1 = "intention", word2 = "execution"
 输出：5
 解释：
 intention -> inention (删除 't')
 inention -> enention (将 'i' 替换为 'e')
 enention -> exention (将 'n' 替换为 'x')
 exention -> exection (将 'n' 替换为 'c')
 exection -> execution (插入 'u')
 */

extension Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count
        let m = word2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        for i in 0..<n+1 {
            dp[i][0] = i
        }
        for j in 0..<m+1 {
            dp[0][j] = j
        }
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        for i in 1..<n+1 {
            for j in 1..<m+1 {
                let left = dp[i][j-1]
                let down = dp[i-1][j]
                let leftDown = dp[i-1][j-1]
                if word1Array[i - 1] == word2Array[j - 1] {
                    dp[i][j] = min(left + 1, down + 1, leftDown)
                } else {
                    dp[i][j] = min(left + 1, down + 1, leftDown + 1)
                }
            }
        }
        return dp[n][m]
    }
    
    private func charAt(string: String, index: Int) -> Character? {
        if index >= string.count || index < 0 {
            return nil
        }
        return string[string.index(string.startIndex, offsetBy: index)]
    }
}

func test072(s: Solution) {
    let word1 = "intention", word2 = "execution"
//    let word1 = "horse", word2 = "ros"
    print(s.minDistance(word1, word2))
}
