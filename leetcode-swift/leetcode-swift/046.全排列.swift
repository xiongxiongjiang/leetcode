//
//  046. 全排列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。
 示例:
 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]
 */

extension Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var output : [[Int]] = []
        var newNums : [Int] = []
        for num in nums {
            newNums.append(num)
        }
        backTrack(&newNums, &output, 0)
        return output
    }
    
    private func backTrack(_ nums : inout [Int], _ output : inout [[Int]], _ first : Int) {
        let count = nums.count
        //如果第一个索引为count 即当前排列已完成
        if first == count {
            //将生成的排列加入数组
            output.append(nums)
            return
        }
        for i in first..<count {
            //在排列中放置第i个整数
            nums.swapAt(first, i)
            //继续生成从第i个整数开始的所有排列
            backTrack(&nums, &output, first + 1)
            //回溯，还原交换的数据
            nums.swapAt(first, i)
        }
    }
    
//    func permute(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
//        var track : [Int] = []
//        backTrackPermute(nums: nums, pos: 0, track: &track, res: &res)
//        return res
//    }
//
//    func backTrackPermute(nums: [Int], pos: Int, track: inout [Int], res: inout [[Int]]) {
//        if pos == nums.count {
//            res.append(track)
//            return
//        }
//        for i in 0..<nums.count {
//            if track.contains(nums[i]) {
//                continue
//            }
//            track.append(nums[i])
//            backTrackPermute(nums: nums, pos: pos + 1, track: &track, res: &res)
//            track.removeLast()
//        }
//    }
}

func test046(s: Solution) {
    let nums = [1, 2, 3]
    print(s.permute(nums))
}


class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var stack = nums
        dfs(nums, &res, &stack, 0)
        return res
    }
    
    func dfs(_ nums: [Int], _ res: inout [[Int]], _ stack: inout [Int], _ start: Int) {
        if start == nums.count {
            res.append(stack)
            return
        }
        for i in start..<nums.count {
            stack.swapAt(i, start)
            dfs(nums, &res, &stack, start + 1)
            stack.swapAt(i, start)
        }
    }
}
