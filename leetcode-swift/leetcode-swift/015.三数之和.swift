//
//  015. 三数之和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
注意：答案中不可以包含重复的三元组。

示例：
给定数组 nums = [-1, 0, 1, 2, -1, -4]，

满足要求的三元组集合为：
[
  [-1, 0, 1],
  [-1, -1, 2]
]
*/

extension Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let newNums = nums.sorted()
        var k = newNums.count - 1
        while k >= 2 {
            let target = -newNums[k]
            var i = 0
            var j = k - 1
            while i < j {
                if newNums[i] + newNums[j] == target {
                    res.append([newNums[i], newNums[j], -target])
                   //去重，跳过相等的
                   while i < j && newNums[i] == newNums[i + 1] {
                       i += 1
                   }
                   while i < j && newNums[j] == newNums[j - 1] {
                       j -= 1
                   }
                    //i向后移动，j向前移动
                    i += 1
                    j -= 1
                } else if newNums[i] + newNums[j] < target {
                    i += 1
                } else {
                    j -= 1
                }

            }
           //去重
           while k >= 2 && newNums[k] == newNums[k - 1] {
               k -= 1
           }
            //从后往前缩小范围
            k -= 1
        }
        return res
    }
}

func test015(s: Solution) {
//    let nums = [-1, 0, 1, 2, -1, -4]
    let nums = [0, 0, 0]
    print(s.threeSum(nums))
}
