//
//  209.长度最小的子数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的 连续 子数组，并返回其长度。如果不存在符合条件的子数组，返回 0。

 示例：
 输入：s = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
  
 进阶：
 如果你已经完成了 O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。
 */

extension Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var j = 0, sum = 0, minLength = Int.max, count = nums.count
        if count == 0 {
            return 0
        }
        for i in 0..<count {
            sum += nums[i]
            while sum >= s {
                sum -= nums[j]
                if i - j + 1 < minLength {
                    minLength = i - j + 1
                }
                j += 1
            }
        }
        return minLength == Int.max ? 0 : minLength
    }
}

func test209(s: Solution) {
//    let nums = [2,3,1,2,4,3]
    let nums = [1, 1]
    print(s.minSubArrayLen(3, nums))
}
