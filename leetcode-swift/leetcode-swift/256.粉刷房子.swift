//
//  256.粉刷房子.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/5/15.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 假如有一排房子，共 n 个，每个房子可以被粉刷成红色、蓝色或者绿色这三种颜色中的一种，你需要粉刷所有的房子并且使其相邻的两个房子颜色不能相同。
 当然，因为市场上不同颜色油漆的价格不同，所以房子粉刷成不同颜色的花费成本也是不同的。每个房子粉刷成不同颜色的花费是以一个 n x 3 的矩阵来表示的。
 例如，costs[0][0] 表示第 0 号房子粉刷成红色的成本花费；costs[1][2] 表示第 1 号房子粉刷成绿色的花费，以此类推。请你计算出粉刷完所有房子最少的花费成本。

 注意：
 所有花费均为正整数。

 示例：
 输入: [[17,2,17],[16,16,5],[14,3,19]]
 输出: 10
 解释: 将 0 号房子粉刷成蓝色，1 号房子粉刷成绿色，2 号房子粉刷成蓝色。
      最少花费: 2 + 5 + 3 = 10。
 */

extension Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        let count = costs.count
        if count == 0 {
            return 0
        }
        //dp[i]表示第i个房子刷哪种颜色时最省钱的总和
        var dp = costs
        for i in 1..<costs.count {
            dp[i][0] += min(dp[i - 1][1], dp[i - 1][2])
            dp[i][1] += min(dp[i - 1][0], dp[i - 1][2])
            dp[i][2] += min(dp[i - 1][0], dp[i - 1][1])
        }
        return dp[costs.count - 1].min() ?? 0
    }
}
