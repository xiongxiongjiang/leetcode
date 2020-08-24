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
        let left = searchRange(nums, target, true)
        if left == nums.count || nums[left] != target {
            return [-1, -1]
        }
        //因为最左边的一个存在，所以一定会有一个最右边的
        let right = searchRange(nums, target, false) - 1
        return [left, right]
    }
    
    func searchRange(_ nums: [Int], _ target: Int, _ isLeft: Bool) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var start = 0
        var end = nums.count
        //isLeft用于除了nums[mid] == target 时该做什么

        /*
        if isLeft == true {
            while start < end {
                let mid = start + (end - start) / 2
                if target > nums[mid] {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
        } else {
            while start < end {
                let mid = start + (end - start) / 2
                if target < nums[mid] {
                    end = mid
                } else {
                    start = mid + 1
                }
            }
        }
        */
        
        //以上的代码合并后，转换成下面的
        while start < end {
            let mid = start + (end - start) / 2
            if target < nums[mid] || (isLeft && target == nums[mid]) {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }
    
}

func test034(s: Solution) {
    let nums = [5,7,7,8,8,10], target = 10
//    let nums = [1], target = 1
    print(s.searchRange(nums, target))
}
