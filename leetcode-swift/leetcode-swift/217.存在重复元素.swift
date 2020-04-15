//
//  217.存在重复元素.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/15.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个整数数组，判断是否存在重复元素。
 如果任意一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false 。

 示例 1:
 输入: [1,2,3,1]
 输出: true
 
 示例 2:
 输入: [1,2,3,4]
 输出: false
 
 示例 3:
 输入: [1,1,1,3,3,4,3,2,4,2]
 输出: true
 */

extension Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = [Int: Int]()
        for num in nums {
            if map[num] != nil {
                return true
            }
            map[num] = num
        }
        return false
    }
}

func test217(s: Solution) {
    let nums = [1,2,3,4]
    print(s.containsDuplicate(nums))
}
