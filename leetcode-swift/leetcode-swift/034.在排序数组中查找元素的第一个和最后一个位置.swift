//
//  034.在排序数组中查找元素的第一个和最后一个位置.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/17.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 你的算法时间复杂度必须是 O(log n) 级别。

 如果数组中不存在目标值，返回 [-1, -1]。

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]
 */

extension Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let left = searchLeft(nums, target)
        let right = searchRight(nums, target)
        if left < 0 || right > nums.count - 1 || left > right {
            return [-1, -1]
        }
        return [left, right]
    }
    
    func searchLeft(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                right = mid - 1
            } else if nums[mid] > target {
                //在左边
                right = mid - 1
            } else if nums[mid] < target {
                //在右边
                left = mid + 1
            }
        }
        return left
    }
    
    
    func searchRight(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                left = mid + 1
            } else if nums[mid] > target {
                //在左边
                right = mid - 1
            } else if nums[mid] < target {
                //在右边
                left = mid + 1
            }
        }
        return right
    }
}

func test034(s: Solution) {
    let nums = [5,7,7,8,8,10], target = 6
    print(s.searchRange(nums, target))
}
