//
//  053. 最大子序和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 示例:
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 
 进阶:
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
 */

extension Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = nums.first ?? 0
        var sum = 0
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            result = max(result, sum)
        }
        return result
    }
}

func test053(s: Solution) {
//    let nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    let nums = [-2, -1, -3]
    print(s.maxSubArray(nums))
}
