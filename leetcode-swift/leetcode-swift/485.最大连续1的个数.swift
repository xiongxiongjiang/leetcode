//
//  485.最大连续1的个数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/27.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二进制数组， 计算其中最大连续1的个数。

 示例 1:

 输入: [1,1,0,1,1,1]
 输出: 3
 解释: 开头的两位和最后的三位都是连续1，所以最大连续1的个数是 3.
 注意：

 输入的数组只包含 0 和1。
 输入数组的长度是正整数，且不超过 10,000。
 */

extension Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var count = 0
        for num in nums {
            if num == 1 {
                count += 1
                maxCount = max(maxCount, count)
            } else {
                count = 0
            }
        }
        return maxCount
    }
}

func test485(s: Solution) {
    let nums = [1,1,0,1,1,1]
    print(s.findMaxConsecutiveOnes(nums))
}
