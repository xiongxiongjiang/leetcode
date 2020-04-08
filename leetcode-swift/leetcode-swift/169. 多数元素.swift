//
//  169. 多数元素.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:
 输入: [3,2,3]
 输出: 3
 
 示例 2:
 输入: [2,2,1,1,1,2,2]
 输出: 2
 */

extension Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        //摩尔投票法
        var res = 0
        var ctn = 0
        for i in 0..<nums.count {
            if ctn == 0 {
                res = nums[i]
                ctn += 1
            } else {
                if res == nums[i] {
                    ctn += 1
                } else {
                    ctn -= 1
                }
            }
        }
        return res
    }
}

func test169(s: Solution) {
    let nums = [2, 2, 1, 1, 1, 2, 2]
    print(s.majorityElement(nums))
}
