//
//  189.旋转数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/23.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

 示例 1:
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 
 示例 2:
 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
 
 说明:
 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 要求使用空间复杂度为 O(1) 的 原地 算法。
 */

extension Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count <= 1 || k % nums.count == 0 {
            return
        }
        let last = Array(nums[nums.count-k%nums.count...nums.count-1])
        let begin = Array(nums[0..<nums.count-k%nums.count])
        nums = last + begin
    }
    
    private func rotateNums(nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        let tmp = nums.last!
        for i in stride(from: nums.count - 1, to: 0, by: -1) {
            nums[i] = nums[i-1]
        }
        nums[0] = tmp
    }
}

func test189(s: Solution) {
//    var nums = [1,2,3,4,5,6,7]
    var nums = [1,2]
    let k = 2
    s.rotate(&nums, k)
    print(nums)
}
