//
//  152.乘积最大子数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/5.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

 示例 1:
 输入: [2,3,-2,4]
 输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 
 示例 2:
 输入: [-2,0,-1]
 输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
 */

extension Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxNum = nums.first!, minNum = nums.first!, res = nums.first!
        for i in 1..<nums.count {
            let mx = maxNum, mn = minNum
            let curr = nums[i]
            maxNum = max(curr, mx * curr, mn * curr)
            minNum = min(curr, mx * curr, mn * curr)
            res = max(maxNum, res)
        }
        return res
    }
}

func test152(s: Solution) {
    let nums = [2,3,-2,4]
    print(s.maxProduct(nums))
}
