//
//  031.下一个排列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/19.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

 必须原地修改，只允许使用额外常数空间。

 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 */


extension Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let count = nums.count
        if count < 2 {
            return
        }
        var i = count - 2
        //从后往前遍历，找到第一个不是降序的下标
        while i >= 0 && nums[i + 1] <= nums[i] {
            i -= 1
        }
        if i >= 0 {
            //再找到刚好比nums[i]大的数字
            var j = count - 1
            while j >= 0 && nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }
        reverse(nums: &nums, i: i + 1, j: nums.count - 1)
    }
    
    private func reverse(nums: inout [Int], i: Int, j: Int) {
        var i = i, j = j
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}

func test031(s: Solution) {
//    var nums = [1, 5, 8, 4, 7, 6, 5, 3, 1]
    var nums = [3, 2, 1]
    s.nextPermutation(&nums)
    print(nums)
}
