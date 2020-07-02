//
//  剑指Offer57.和为s的两个数字.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

 示例 1：
 输入：nums = [2,7,11,15], target = 9
 输出：[2,7] 或者 [7,2]
 
 示例 2：
 输入：nums = [10,26,30,31,47,60], target = 40
 输出：[10,30] 或者 [30,10]
  
 限制：
 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^6
 
 本题和leetcode167相同
 */

extension Solution {
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0, right = nums.count - 1
        while left < right {
            let sum = nums[left] + nums[right]
            if sum == target {
                break
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return [nums[left], nums[right]]
    }
}


func testOffer57(s: Solution) {
    let nums = [10,26,30,31,47,60], target = 40
    print(s.twoSum1(nums, target))
}
