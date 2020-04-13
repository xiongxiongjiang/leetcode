//
//  062.不同路径.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/13.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

 问总共有多少条不同的路径？

 示例 1:
 输入: m = 3, n = 2
 输出: 3
 解释:
 从左上角开始，总共有 3 条路径可以到达右下角。
 1. 向右 -> 向右 -> 向下
 2. 向右 -> 向下 -> 向右
 3. 向下 -> 向右 -> 向右
 
 示例 2:
 输入: m = 7, n = 3
 输出: 28

 提示：
 1 <= m, n <= 100
 题目数据保证答案小于等于 2 * 10 ^ 9
 */

extension Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if n <= 0 || m <= 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        dp[0][0] = 1
        if n > 1 {
            dp[1][0] = 1
        }
        if m > 1 {
            dp[0][1] = 1
        }
        for i in 0..<n {
            for j in 0..<m {
                let left = i - 1 >= 0 ? dp[i - 1][j] : 0
                let top = j - 1 >= 0 ? dp[i][j - 1] : 0
                if dp[i][j] == 0 {
                    dp[i][j] = left + top
                }
            }
        }
        return dp[n - 1][m - 1]
    }
}

func test062(s: Solution) {
    let m = 1
    let n = 2
    print(s.uniquePaths(m, n))
}
