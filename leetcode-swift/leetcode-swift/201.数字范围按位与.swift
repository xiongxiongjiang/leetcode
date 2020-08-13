//
//  201.数字范围按位与.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/5.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定范围 [m, n]，其中 0 <= m <= n <= 2147483647，返回此范围内所有数字的按位与（包含 m, n 两端点）。

 示例 1:
 输入: [5,7]
 输出: 4
 
 示例 2:
 输入: [0,1]
 输出: 0
 */

extension Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var shift = 0
        var m = m, n = n
        while m < n {
            m >>= 1
            n >>= 1
            shift += 1
        }
        return n << shift
    }
}

func test201(s: Solution) {
    print(s.rangeBitwiseAnd(15, 17))
}
