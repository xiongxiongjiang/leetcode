//
//  078.子集.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 说明：解集不能包含重复的子集。
 
 示例:
 输入: nums = [1,2,3]
 输出:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 */

extension Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var stack = [Int]()
        backTrackSubsets(nums: nums, start: 0, stack: &stack, res: &res)
        return res
    }
    
    func backTrackSubsets(nums: [Int], start: Int, stack: inout [Int], res: inout [[Int]]) {
        res.append(stack)
        for i in start..<nums.count {
            stack.append(nums[i])
            backTrackSubsets(nums: nums, start: i + 1, stack: &stack, res: &res)
            stack.removeLast()
        }
    }
}

func test078(s: Solution) {
    let nums = [1,2,3]
    print(s.subsets(nums))
}

class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var stack = [Int]()
        var res = [[Int]]()
        dfs(nums: nums, stack: &stack, res: &res, start: 0)
        return res
    }
    
    func dfs(nums: [Int], stack: inout [Int], res: inout [[Int]], start: Int) {
        res.append(stack)
        for i in start..<nums.count {
            stack.append(nums[i])
            dfs(nums: nums, stack: &stack, res: &res, start: i + 1)
            stack.removeLast()
        }
    }
}
