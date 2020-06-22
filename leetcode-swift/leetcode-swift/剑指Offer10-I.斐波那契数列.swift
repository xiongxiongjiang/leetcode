//
//  剑指Offer10-I.斐波那契数列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

extension Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        for i in 2...n {
            dp[i] = (dp[i-1] + dp[i-2]) % 1000000007
        }
        return dp[n]
    }
    
    func fib1(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        var first = 0
        var second = 1
        let mod = Int(1e9) + 7
        for _ in 2...n {
            let tmp = (first + second) % mod
            first = second
            second = tmp
        }
        return second
    }
    
    func fib3(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        return fib3(n - 1) + fib3(n - 2)
    }
    
}

func testOffer10I(s: Solution) {
    print(s.fib3(39))
}
