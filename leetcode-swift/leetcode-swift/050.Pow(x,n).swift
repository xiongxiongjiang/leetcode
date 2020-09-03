//
//  050.Pow(x,n).swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/9/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 实现 pow(x, n) ，即计算 x 的 n 次幂函数。

 示例 1:
 输入: 2.00000, 10
 输出: 1024.00000
 
 示例 2:
 输入: 2.10000, 3
 输出: 9.26100
 
 示例 3:
 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25
 
 说明:
 -100.0 < x < 100.0
 n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。
 */

extension Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        return n >= 0 ? quickMul(x, n) : 1 / quickMul(x, n)
    }
    
    func quickMul(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        let y = quickMul(x, n / 2)
        return n % 2 == 0 ? y * y : y * y * x
    }
}


func test050(s: Solution) {
    print(s.myPow(2.0, -2))
}
