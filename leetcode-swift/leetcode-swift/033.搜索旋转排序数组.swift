//
//  033.搜索旋转排序数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/9.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 你可以假设数组中不存在重复的元素。

 你的算法时间复杂度必须是 O(log n) 级别。

 示例 1:
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 
 示例 2:
 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 */

extension Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let count = nums.count
        if count == 0 {
            return -1
        }
        var start = 0, end = count - 1, mid = 0
        while start <= end {
            mid = start + (end - start) / 2
            if nums[mid] == target {
                return mid
            }
            if nums[start] <= nums[mid] {
                //前半部分有序
                if target >= nums[start] && target <= nums[mid] {
                    end = mid
                } else {
                    start = mid + 1
                }
            } else {
                //后半部分有序
                if target >= nums[mid] && target <= nums[end] {
                    start = mid
                } else {
                    end = mid - 1
                }
            }
        }
        return -1
    }
}

func test033(s: Solution) {
    let nums = [4,5,6,7,0,1,2]
    let target = 0
    print(s.search(nums, target))
}
