//
//  剑指Offer14-I.剪绳子.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/24.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一根长度为 n 的绳子，请把绳子剪成整数长度的 m 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 k[0],k[1]...k[m-1] 。请问 k[0]*k[1]*...*k[m-1] 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

 示例 1：
 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1
 
 示例 2:
 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36
 
 提示：
 2 <= n <= 58
 注意：本题与主站 343 题相同：https://leetcode-cn.com/problems/integer-break/
 */

extension Solution {
    func cuttingRope(_ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: n + 1)
        dp[1] = 1
        dp[2] = 1
        if n == 1 || n == 2 {
            return 1
        }
        for i in 3...n {
            for j in 1..<i {
                //dp[i]:整一段不剪
                //(i - j) * j: 从j处剪一下，i-j不剪
                //j * dp[i - j]): 从j处剪一下，剩下的i-j也剪
                dp[i] = max(dp[i], max((i - j) * j, j * dp[i - j]))
            }
        }
        return dp[n]
    }
}

func testOffer14I(s: Solution) {
    let n = 2
    print(s.cuttingRope(n))
}
