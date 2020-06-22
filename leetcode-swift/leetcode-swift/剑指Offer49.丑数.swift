//
//  剑指Offer49.丑数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 我们把只包含因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

 示例:
 输入: n = 10
 输出: 12
 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 
 说明:
 1 是丑数。
 n 不超过1690。
 注意：本题与主站 264 题相同：https://leetcode-cn.com/problems/ugly-number-ii/
 */

extension Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        //dp[i] 代表第i+1个丑数
        var dp = [Int](repeating: 1, count: n)
        var a = 0, b = 0, c = 0
        for i in 1..<n {
            let n2 = dp[a] * 2
            let n3 = dp[b] * 3
            let n5 = dp[c] * 5
            //每一个丑数都是前面的丑数乘以2、3、5得到的
            dp[i] = min(n2, n3, n5)
            if dp[i] == n2 {
                a += 1
            }
            if dp[i] == n3 {
                b += 1
            }
            if dp[i] == n5 {
                c += 1
            }
        }
        return dp[n - 1]
    }
}

func testOffer49(s: Solution) {
    let n = 10
    print(s.nthUglyNumber(n))
}
