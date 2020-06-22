//
//  剑指Offer10-II.青蛙跳台阶问题.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：
 输入：n = 2
 输出：2
 
 示例 2：
 输入：n = 7
 输出：21
 
 提示：
 0 <= n <= 100
 注意：本题与主站 70 题相同：https://leetcode-cn.com/problems/climbing-stairs/
 */

extension Solution {
    func numWays(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        if n <= 2 {
            return n
        }
        var prev = 1
        var curr = 2
        let mod = Int(1e9) + 7
        for _ in 3...n {
            let sum = (prev + curr) % mod
            prev = curr
            curr = sum
        }
        return curr
    }
}

func testOffer10II(s: Solution) {
    print(s.numWays(7))
}
