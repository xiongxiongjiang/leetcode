//
//  剑指Offer60.n个骰子的点数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 把n个骰子扔在地上，所有骰子朝上一面的点数之和为s。输入n，打印出s的所有可能的值出现的概率。

 你需要用一个浮点数数组返回答案，其中第 i 个元素代表这 n 个骰子所能掷出的点数集合中第 i 小的那个的概率。
  
 示例 1:
 输入: 1
 输出: [0.16667,0.16667,0.16667,0.16667,0.16667,0.16667]
 
 示例 2:
 输入: 2
 输出: [0.02778,0.05556,0.08333,0.11111,0.13889,0.16667,0.13889,0.11111,0.08333,0.05556,0.02778]
  
 限制：
 1 <= n <= 11
 */

extension Solution {
    func twoSum(_ n: Int) -> [Double] {
        var dp = [Double](repeating: 1 / 6, count: 6)
        guard n > 1 else { return dp }
        //每一轮循环解决i个骰子的情况下出现的概率
        for i in 2...n {
            //i个骰子的点数概率数组长度为 i * 5 + 1
            var tmp = [Double](repeating: 0, count: 5 * i + 1)
            for j in 0..<dp.count {
                for k in 0..<6 {
                    //点数为j+k的情况有可能是点数为j时，再投掷一次产生的
                    tmp[j + k] += dp[j] / 6
                }
            }
            dp = tmp
        }
        return dp
    }
}


func testOffer60(s: Solution) {
    print(s.twoSum(2))
}
