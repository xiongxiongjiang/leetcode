//
//  041.缺失的第一个正数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/11.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一个未排序的整数数组，请你找出其中没有出现的最小的正整数。
 
 示例 1:
 输入: [1,2,0]
 输出: 3
 
 示例 2:
 输入: [3,4,-1,1]
 输出: 2
 
 示例 3:
 输入: [7,8,9,11,12]
 输出: 1
  
 提示：
 你的算法的时间复杂度应为O(n)，并且只能使用常数级别的额外空间。
 */

extension Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count > 0 else {
            return 1
        }
        var map = [Int:Int]()
        for i in 0..<count {
            map[nums[i]] = 1
        }
        for i in 1...count {
            //中间有空缺
            if map[i] == nil {
                return i
            }
        }
        //正好是0到count都满了
        return count + 1
    }
}

func test041(s: Solution) {
    let nums1 = [7,8,9,11,12] //1
    let nums2 = [1,2,0] // 3
    let nums3 = [1,1] // 2
    let nums4 = [2,1] // 3
    print(s.firstMissingPositive(nums1))
    print(s.firstMissingPositive(nums2))
    print(s.firstMissingPositive(nums3))
    print(s.firstMissingPositive(nums4))
}
