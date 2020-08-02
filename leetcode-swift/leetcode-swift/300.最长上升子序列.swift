//
//  300.最长上升子序列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个无序的整数数组，找到其中最长上升子序列的长度。

 示例:
 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 
 说明:
 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 你算法的时间复杂度应该为 O(n2) 。
 进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?
 */

extension Solution {
    
    //动态规划
    func lengthOfLIS1(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        var res = 0
        var dp = [Int](repeating: 1, count: count)
        for i in 0..<count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        
        return 0
    }
}

func test300(s: Solution) {
    let nums = [10,9,2,5,3,7,101,18]
    print(s.lengthOfLIS(nums))
}
