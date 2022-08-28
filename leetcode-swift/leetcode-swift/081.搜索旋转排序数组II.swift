//
//  081.搜索旋转排序数组 II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/11.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,0,1,2,2,5,6] 可能变为 [2,5,6,0,0,1,2] )。

 编写一个函数来判断给定的目标值是否存在于数组中。若存在返回 true，否则返回 false。

 示例 1:
 输入: nums = [2,5,6,0,0,1,2], target = 0
 输出: true
 
 示例 2:
 输入: nums = [2,5,6,0,0,1,2], target = 3
 输出: false
 
 进阶:
 这是 搜索旋转排序数组 的延伸题目，本题中的 nums  可能包含重复元素。
 这会影响到程序的时间复杂度吗？会有怎样的影响，为什么？
 */

extension Solution {
    func search81(_ nums: [Int], _ target: Int) -> Bool {
        let count = nums.count
        if nums.count == 0 {
            return false
        }
        var start = 0
        var end = count - 1
        while start <= end {
            let mid = start + (end - start) / 2
            if nums[mid] == target {
                return true
            }
            //10111 和 11101 这种。此种情况下 nums[start] == nums[mid]，分不清到底是前面有序还是后面有序，此时 start++ 即可。相当于去掉一个重复的干扰项。
            if nums[start] == nums[mid] {
                start += 1
                continue
            }
            if nums[start] < nums[mid] {
                //前半部分有序
                //target在前半部分
                if target >= nums[start] && target < nums[mid] {
                    end = mid - 1
                } else {
                    //target在后半部分
                    start = mid + 1
                }
            } else {
                //后半部分有序
                //target在后半部分
                if target > nums[mid] && target <= nums[end] {
                    start = mid + 1
                } else {
                    //target在前半部分
                    end = mid - 1
                }
            }
        }
        return false
    }
}

func test081(s: Solution) {
    let nums = [1,3,5]
    print(s.search81(nums, 1))
}


class Solution81 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let count = nums.count
        if count == 0 {
            return false
        }
        var left = 0
        var right = count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let midNum = nums[mid]
            let leftNum = nums[left]
            let rightNum = nums[right]
            if target == midNum {
                return true
            }
            if leftNum == midNum {
                left += 1
                continue
            }
            if leftNum < midNum {
                if target >= leftNum && target < midNum {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if target > midNum && target <= rightNum {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return false
    }
}
