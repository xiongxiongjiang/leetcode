//
//  219. 存在重复元素 II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的 绝对值 至多为 k。
 
 示例 1:
 输入: nums = [1,2,3,1], k = 3
 输出: true
 
 示例 2:
 输入: nums = [1,0,1,1], k = 1
 输出: true
 
 示例 3:
 输入: nums = [1,2,3,1,2,3], k = 2
 输出: false
 */

extension Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var aSet = Set<Int>()
        for i in 0..<nums.count {
            if aSet.contains(nums[i]) {
                return true
            }
            aSet.insert(nums[i])
            if aSet.count > k {
                aSet.remove(nums[i - k])
            }
        }
        return false
    }
}

func test219(s: Solution) {
    print(s.containsNearbyDuplicate([1,0,1,1], 2))
}
