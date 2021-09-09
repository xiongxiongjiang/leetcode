//
//  070. 爬楼梯.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*

 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 示例 2：
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 */

extension Solution {
    func climbStairs(_ n: Int) -> Int {
        //dp 算法分析
        //第n阶楼梯（f(n)）总是由第n-1阶楼梯（f(n-1)）走一步楼梯，或者由n-2阶楼梯（f(n-2)）走两步楼梯上来的
        if n <= 2 {
            return n
        }
        var prev = 1
        var curr = 2
        for _ in 3...n {
            let sum = prev + curr
            prev = curr
            curr = sum
        }
        return curr
    }
    
    func climbStairs2(_ n: Int) -> Int {
        //dp 算法分析
        //第n阶楼梯（f(n)）总是由第n-1阶楼梯（f(n-1)）走一步楼梯，或者由n-2阶楼梯（f(n-2)）走两步楼梯上来的
        if n <= 2 {
            return n
        }
        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    
}

func test070(s: Solution) {
    print(s.climbStairs2(4))
}
