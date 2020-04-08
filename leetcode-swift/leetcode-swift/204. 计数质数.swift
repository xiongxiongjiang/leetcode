//
//  204. 计数质数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 统计所有小于非负整数 n 的质数的数量。

 示例:

 输入: 10
 输出: 4
 解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
 */

extension Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else { return 0 }
        var sieve = [Bool](repeating: true, count: n)
        var count = n / 2
        var i = 3
        while i * i < n {
            if sieve[i] {
                var j = i * i
                while j < n {
                    if sieve[j] {
                        count -= 1
                        sieve[j] = false
                    }
                    j += 2 * i
                }
            }
            i += 2
        }
        return count
    }
}

func test204(s: Solution) {
    print(s.countPrimes(100))
}
