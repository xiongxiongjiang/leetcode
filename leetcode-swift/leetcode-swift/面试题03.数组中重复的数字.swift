//
//  面试题03.数组中重复的数字.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/28.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 找出数组中重复的数字。

 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

 示例 1：
 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3

 限制：
 2 <= n <= 100000
 */

extension Solution {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var numSet = Set<Int>()
        for num in nums {
            if numSet.contains(num) {
                return num
            }
            numSet.insert(num)
        }
        
        //输入的数组不是引用的，没法空间复杂度为O(1)
//        var nums = nums
//        for i in 0..<nums.count {
//            while nums[i] != i {
//                if nums[i] == nums[nums[i]] {
//                    return nums[i]
//                }
//                nums.swapAt(i, nums[i])
//            }
//        }
        return -1
    }
}

func testOffer003(s: Solution) {
    let nums = [2, 3, 1, 0, 2, 5, 3]
    print(s.findRepeatNumber(nums))
}
