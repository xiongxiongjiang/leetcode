//
//  039. 组合总和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/3.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 candidates 中的数字可以无限制重复被选取。

 说明：
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 
 示例 1:
 输入: candidates = [2,3,6,7], target = 7,
 所求解集为:
 [
   [7],
   [2,2,3]
 ]
 
 示例 2:
 输入: candidates = [2,3,5], target = 8,
 所求解集为:
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
 */

extension Solution {
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        combinationSum(candidates, target, 0, [Int](), &result)
        return result
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int, _ currentInex: Int, _ usededNums: [Int], _ result: inout [[Int]]) {
        if target <= 0  {
            if target == 0 {
                result.append(usededNums)
            }
            return
        }
        for i in currentInex..<candidates.count {
            let currentValue = candidates[i]
            if currentValue > target {
                continue
            }
            var usdedNumsCopy = usededNums
            usdedNumsCopy.append(currentValue)
            combinationSum(candidates, target - currentValue, i, usdedNumsCopy, &result)
        }
    }
}

func test039(s: Solution) {
    let nums = [2, 3, 5]
    print(s.combinationSum(nums, 8))
}
