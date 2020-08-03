//
//  416.分割等和子集.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/3.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 
 0-1 背包问题
 
 给定一个只包含正整数的非空数组。是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。

 注意:
 每个数组中的元素不会超过 100
 数组的大小不会超过 200
 
 示例 1:
 输入: [1, 5, 11, 5]
 输出: true
 解释: 数组可以分割成 [1, 5, 5] 和 [11].
  
 示例 2:
 输入: [1, 2, 3, 5]
 输出: false
 解释: 数组不能分割成两个元素和相等的子集.
 */

extension Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let count = nums.count
        if count < 2 {
            return false
        }
        var sum = 0
        for num in nums {
            sum += num
        }
        if sum % 2 != 0 {
            return false
        }
        let target = sum / 2
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: target + 1), count: count)
        //base case 就是 dp[..][0] = true 和 dp[0][..] = false，因为背包没有空间的时候，就相当于装满了，而当没有物品可选择的时候，肯定没办法装满背包
        for i in 0..<count {
            dp[i][0] = true
        }
        for i in 1..<count {
            for j in 0...target {
                dp[i][j] = dp[i - 1][j]
                if nums[i] == j {
                    dp[i][j] = true
                    continue
                }
                //1、不选择 nums[i]，如果在 [0, i - 1] 这个子区间内已经有一部分元素，使得它们的和为 j ，那么 dp[i][j] = true；
                //2、选择 nums[i]，如果在 [0, i - 1] 这个子区间内就得找到一部分元素，使得它们的和为 j - nums[i]
                if nums[i] < j {
                    dp[i][j] = dp[i-1][j] || dp[i-1][j-nums[i]]
                }
            }
        }
        return dp[count-1][target]
    }
    
    func canPartition1(_ nums: [Int]) -> Bool {
        let count = nums.count
        if count < 2 {
            return false
        }
        var sum = 0
        for num in nums {
            sum += num
        }
        if sum % 2 != 0 {
            return false
        }
        let target = sum / 2
        var dp = [Bool](repeating: false, count: target + 1)
        dp[0] = true
        for i in 0..<count {
            for j in stride(from: target, through: nums[i], by: -1) {
                if dp[target] {
                    return true
                }
                dp[j] = dp[j] || dp[j-nums[i]]
            }
        }
        return dp[target]
    }
}

func test416(s: Solution) {
    let nums = [1,5,11,5]
    print(s.canPartition1(nums))
}
