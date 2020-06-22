//
//  剑指Offer66.构建乘积数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个数组 A[0,1,…,n-1]，请构建一个数组 B[0,1,…,n-1]，其中 B 中的元素 B[i]=A[0]×A[1]×…×A[i-1]×A[i+1]×…×A[n-1]。不能使用除法。
 
 示例:
 输入: [1,2,3,4,5]
 输出: [120,60,40,30,24]

 提示：
 所有元素乘积之和不会溢出 32 位整数
 a.length <= 100000
 */

extension Solution {
    func constructArr(_ a: [Int]) -> [Int] {
        let count = a.count
        if count == 0 {
            return a
        }
        var b = [Int](repeating: 1, count: count)
        b[0] = 1
        var left = 1
        for i in 0..<count {
            b[i] = left
            left *= a[i]
        }
        var right = 1
        for i in stride(from: count - 1, through: 0, by: -1) {
            b[i] *= right
            right *= a[i]
        }
        return b
    }
}

func testOffer66(s: Solution) {
    print(s.constructArr([1, 2, 3, 4, 5]))
}
