//
//  045.跳跃游戏II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/9.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个非负整数数组，你最初位于数组的第一个位置。

 数组中的每个元素代表你在该位置可以跳跃的最大长度。

 你的目标是使用最少的跳跃次数到达数组的最后一个位置。

 示例:
 输入: [2,3,1,1,4]
 输出: 2
 解释: 跳到最后一个位置的最小跳跃数是 2。
      从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。
 
 说明:
 假设你总是可以到达数组的最后一个位置。
 */

extension Solution {
    func jump(_ nums: [Int]) -> Int {
        var end = 0
        var maxPosition = 0
        var steps = 0
        //在遍历数组时，我们不访问最后一个元素，这是因为在访问最后一个元素之前，我们的边界一定大于等于最后一个位置，否则就无法跳到最后一个位置了。如果访问最后一个元素，在边界正好为最后一个位置的情况下，我们会增加一次「不必要的跳跃次数」，因此我们不必访问最后一个元素。
        for i in 0..<nums.count-1 {
            maxPosition = max(maxPosition, i +  nums[i])
            //跳到了边界，步数加一
            if i == end {
                end = maxPosition
                steps += 1
            }
        }
        return steps
    }
}

func test045(s: Solution) {
    let nums = [2,3,1,1,4]
    print(s.jump(nums))
}
