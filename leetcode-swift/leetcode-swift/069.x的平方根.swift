//
//  069. x 的平方根.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:
 输入: 4
 输出: 2
 
 示例 2:
 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。
 */

extension Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 1 {
            return 1
        }
        var min = 0, max = x
        while (max - min) > 1 {
            //二分查找
            let m = (max + min) / 2
            if x / m < m {
                max = m
            } else {
                min = m
            }
        }
        return min
    }
}

func test069(s: Solution) {
    print(s.mySqrt(99))
}

class Solution69 {
    func mySqrt(_ x: Int) -> Int {
        if x <= 1 {
            return x
        }
        var min = 0
        var max = x
        while max - min > 1 {
            let mid = min + (max - min) / 2
            if x < mid * mid {
                max = mid
            } else {
                min = mid
            }
        }
        return min
    }
}
