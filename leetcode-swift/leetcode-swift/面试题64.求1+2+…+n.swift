//
//  面试题64.求1+2+…+n.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。

 示例 1：
 输入: n = 3
 输出: 6
 
 示例 2：
 输入: n = 9
 输出: 45
  
 限制：
 1 <= n <= 10000
 */

extension Solution {
    func sumNums(_ n: Int) -> Int {
        return n == 0 ? 0 : n + sumNums(n - 1)
    }
}

func testOffer64(s: Solution) {
    let n = 9
    print(s.sumNums(n))
}
