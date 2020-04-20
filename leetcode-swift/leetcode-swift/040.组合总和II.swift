//
//  040.组合总和II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 candidates 中的每个数字在每个组合中只能使用一次。
 说明：
 所有数字（包括目标数）都是正整数。
 解集不能包含重复的组合。
 
 示例 1:
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 所求解集为:
 [
   [1, 7],
   [1, 2, 5],
   [2, 6],
   [1, 1, 6]
 ]
 
 示例 2:
 输入: candidates = [2,5,2,1,2], target = 5,
 所求解集为:
 [
   [1,2,2],
   [5]
 ]
 */

extension Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var track = [Int]()
        let candidates = candidates.sorted()
        backTrackCombinationSum2(candidates: candidates, track: &track, res: &res, target: target, start: 0)
        return res
    }
    
    func backTrackCombinationSum2(candidates: [Int], track: inout [Int], res: inout [[Int]], target: Int, start: Int) {
        //剪枝
        if target < 0 {
            return
        }
        if target == 0 {
            res.append(track)
            return
        }
        for i in start..<candidates.count {
            if i > start && candidates[i - 1] == candidates[i] {
                continue
            }
            track.append(candidates[i])
            backTrackCombinationSum2(candidates: candidates, track: &track, res: &res, target: target - candidates[i], start: i + 1)
            track.removeLast()
        }
    }
}

func test040(s: Solution) {
    let candidates = [10,1,2,7,6,1,5], target = 8
    print(s.combinationSum2(candidates, target))
}
