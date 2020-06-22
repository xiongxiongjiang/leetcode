//
//  剑指Offer53-II.0～n-1中缺失的数字.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。

 示例 1:
 输入: [0,1,3]
 输出: 2
 
 示例 2:
 输入: [0,1,2,3,4,5,6,7,9]
 输出: 8
  
 限制：
 1 <= 数组长度 <= 10000
 */

extension Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let count = nums.count
        for i in 0..<count {
            if i != nums[i] {
                return i
            }
        }
        return count
    }
}
