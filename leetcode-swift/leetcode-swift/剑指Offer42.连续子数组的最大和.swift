//
//  剑指Offer42.连续子数组的最大和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 输入一个整型数组，数组里有正数也有负数。数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。
 
 要求时间复杂度为O(n)。

 示例1:
 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
  
 提示：
 1 <= arr.length <= 10^5
 -100 <= arr[i] <= 100
 
 注意：本题与主站 53 题相同：https://leetcode-cn.com/problems/maximum-subarray/
 */

extension Solution {
    func maxSubArray1(_ nums: [Int]) -> Int {
        var sum = 0
        var res = nums.first!
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            res = max(res, sum)
        }
        return res
    }
}

func testOffer42(s: Solution) {
    print(s.maxSubArray1([-2,1,-3,4,-1,2,1,-5,4]))
}
