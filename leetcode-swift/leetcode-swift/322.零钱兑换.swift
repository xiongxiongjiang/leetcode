//
//  322.零钱兑换.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/9.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。

 示例 1:
 输入: coins = [1, 2, 5], amount = 11
 输出: 3
 解释: 11 = 5 + 5 + 1
 
 示例 2:
 输入: coins = [2], amount = 3
 输出: -1
 
 说明:
 你可以认为每种硬币的数量是无限的。
 */

extension Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        //dp[amount] 表示amount金额的时候所需要最少的硬币个数
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for coin in coins {
            if coin <= amount {
                for i in coin...amount {
                    //动态转移方程 dp[i] = min(dp[i - 1], dp[i - 2], dp[i - 5]) + 1
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

func test322(s: Solution) {
//    let coins = [1, 2, 5]
    let coins = [1, 7, 11]
    let amount = 14
    print(s.coinChange(coins, amount))
}
