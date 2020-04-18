//
//  016.最接近的三数之和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/18.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.

 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 */

extension Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        let nums = nums.sorted()
        var res = nums[0] + nums[1] + nums[2]
        for i in 0..<nums.count {
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if abs(sum - target) < abs(res - target) {
                    res = sum
                }
                if sum > target {
                    right -= 1
                } else if sum < target {
                    left += 1
                } else {
                    return res
                }
            }
        }
        return res
    }
}

func test016(s: Solution) {
//    let nums = [-1, 2, 1, -4]
//    let nums = [0, 1, 2]
    let nums = [1,1,-1,-1,3]
    let target = 1
    print(s.threeSumClosest(nums, target))
}
