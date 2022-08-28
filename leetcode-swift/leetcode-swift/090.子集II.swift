//
//  090.子集II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/11.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:

 输入: [1,2,2]
 输出:
 [
   [2],
   [1],
   [1,2,2],
   [2,2],
   [1,2],
   []
 ]

 */

extension Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var stack = [Int]()
        var res = [[Int]]()
        let nums = nums.sorted()
        dfs90(nums: nums, stack: &stack, res: &res, index: 0)
        return res
    }
    
    func dfs90(nums: [Int], stack: inout [Int], res: inout [[Int]], index: Int) {
        res.append(stack)
        if index == nums.count {
            return
        }
        for i in index..<nums.count {
            if i > index && nums[i] == nums[i-1] {
                continue
            }
            stack.append(nums[i])
            dfs90(nums: nums, stack: &stack, res: &res, index: i + 1)
            stack.removeLast()
        }
    }
    
    func subsetsWithDup2(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = [[]]
        var index = 0
        while index < nums.count {
            var repeatCount = 0
            for dupIndex in index..<nums.count {
                if nums[dupIndex] == nums[index] {
                    repeatCount += 1
                } else {
                    break
                }
            }
            let existSubSets = result
            for existSubset in existSubSets {
                var subset = existSubset
                for _ in 0..<repeatCount {
                    subset.append(nums[index])
                    result.append(subset)
                }
            }
            index += repeatCount
        }
        return result
    }
}


func test090(s: Solution) {
    let nums = [1, 2, 2]
    print(s.subsetsWithDup(nums))
}

class Solution90 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var stack = [Int]()
        // 排序
        let nums = nums.sorted()
        dfs(nums: nums, stack: &stack, res: &res, start: 0)
        return res
    }
    
    func dfs(nums: [Int], stack: inout [Int], res: inout [[Int]], start: Int) {
        res.append(stack)
        for i in start..<nums.count {
            // 配合排序 去重
            if i > start && nums[i] == nums[i-1] {
                continue
            }
            stack.append(nums[i])
            dfs(nums: nums, stack: &stack, res: &res, start: i+1)
            stack.removeLast()
        }
    }
}
