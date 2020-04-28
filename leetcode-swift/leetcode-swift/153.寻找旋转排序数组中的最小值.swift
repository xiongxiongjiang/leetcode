//
//  153.寻找旋转排序数组中的最小值.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/28.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 请找出其中最小的元素。

 你可以假设数组中不存在重复元素。

 示例 1:

 输入: [3,4,5,1,2]
 输出: 1
 示例 2:

 输入: [4,5,6,7,0,1,2]
 输出: 0
 */

extension Solution {
    func findMin(_ nums: [Int]) -> Int {
        let count = nums.count
        var left = 0
        var right = count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < nums[right] {
                right = mid
            } else if nums[mid] > nums[right] {
                left = mid + 1
            }
        }
        return nums[left]
    }
}

func test153(s: Solution) {
    let nums = [4,5,6,7,0,1,2]
    print(s.findMin(nums))
}
