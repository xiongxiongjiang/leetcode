//
//  064.最小路径和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/13.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 说明：每次只能向下或者向右移动一步。
 示例:
 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。
 */

extension Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid.first?.count ?? 0
        if n <= 0 || m <= 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        dp[0][0] = grid[0][0]
        if n > 1 {
            dp[1][0] = grid[0][0] + grid[1][0]
        }
        if m > 1 {
            dp[0][1] = grid[0][0] + grid[0][1]
        }
        for i in 0..<n {
            for j in 0..<m {
                let left = i - 1 >= 0 ? dp[i - 1][j] : 0
                let top = j - 1 >= 0 ? dp[i][j - 1] : 0
                if i == 0 && j != 0 {
                    dp[i][j] = grid[i][j] + dp[i][j - 1]
                } else if i != 0 && j == 0 {
                    dp[i][j] = grid[i][j] + dp[i - 1][j]
                } else {
                    dp[i][j] = grid[i][j] + min(left, top)
                }
            }
        }
        return dp[n - 1][m - 1]
    }
}


func test064(s: Solution) {
    let grid = [
        [1,3,1],
        [1,5,1],
        [4,2,1]
    ]
    print(s.minPathSum(grid))
}

class Solution64 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid.first?.count ?? 0
        if n <= 0 || m <= 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        dp[0][0] = grid[0][0]
        for i in 1..<m {
            dp[0][i] = dp[0][i-1] + grid[0][i]
        }
        for i in 1..<n {
            dp[i][0] = dp[i-1][0] + grid[i][0]
        }
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
            }
        }
        return dp[n-1][m-1]
    }
}
