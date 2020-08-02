//
//  560.和为K的子数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个整数数组和一个整数 k，你需要找到该数组中和为 k 的连续的子数组的个数。

 示例 1 :
 输入:nums = [1,1,1], k = 2
 输出: 2 , [1,1] 与 [1,1] 为两种不同的情况。
 
 说明 :
 数组的长度为 [1, 20,000]。
 数组中元素的范围是 [-1000, 1000] ，且整数 k 的范围是 [-1e7, 1e7]。
 */

extension Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var preSum = 0, count = 0
        var map = [0: 1]
        for num in nums {
            preSum += num
            //map[preSum - k] preSum代表0..<i的前缀和，k代表 j..<i的前缀和，map[preSum - k]存在，代表存在0..<j的前缀和使得j..<i前缀和为k
            if let tmp = map[preSum - k] {
                count += tmp
            }
            if map[preSum] == nil {
                map[preSum] = 1
            } else {
                map[preSum] = map[preSum]! + 1
            }
        }
        return count
    }
}

func test560(s: Solution) {
    print(s.subarraySum([0,0,0,0,0,0,0,0,0,0], 0))
}
