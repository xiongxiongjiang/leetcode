//
//  063.不同路径II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
 
 网格中的障碍物和空位置分别用 1 和 0 来表示。
 说明：m 和 n 的值均不超过 100。

 示例 1:
 输入:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 输出: 2
 解释:
 3x3 网格的正中间有一个障碍物。
 从左上角到右下角一共有 2 条不同的路径：
 1. 向右 -> 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右 -> 向右
 */

extension Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let nr = obstacleGrid.count
        if nr == 0 {
            return 0
        }
        let nc = obstacleGrid[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nc), count: nr)
        dp[0][0] = 1
        for i in 0..<nr {
            for j in 0..<nc {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                    continue
                }
                var top = 0, left = 0
                if i - 1 >= 0 && obstacleGrid[i - 1][j] != 1 {
                    top = dp[i - 1][j]
                }
                if j - 1 >= 0 && obstacleGrid[i][j - 1] != 1 {
                    left = dp[i][j - 1]
                }
                if dp[i][j] == 0 {
                    dp[i][j] = top + left
                }
            }
        }
        return dp[nr - 1][nc - 1]
    }
}

func test063(s: Solution) {
//    let grid = [
//        [0,0,0],
//        [0,1,0],
//        [0,0,0]
//    ]
    let grid = [[0]]
    print(s.uniquePathsWithObstacles(grid))
}
