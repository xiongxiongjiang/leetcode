//
//  剑指Offer61.扑克牌中的顺子.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任意数字。A 不能视为 14。

 示例 1:
 输入: [1,2,3,4,5]
 输出: True

 示例 2:
 输入: [0,0,1,2,5]
 输出: True

 限制：
 数组长度为 5
 数组的数取值为 [0, 13] .
 */

extension Solution {
    func isStraight(_ nums: [Int]) -> Bool {
        let nums = nums.sorted()
        var zeroCount = 0
        for i in 0..<nums.count-1 {
            if nums[i] == 0 {
                zeroCount += 1
            } else if nums[i] == nums[i+1] {
                return false
            }
        }
        //nums[zeroCount]其实就是最小牌
        return nums.last! - nums[zeroCount] < 5
    }
}

func testOffer61(s: Solution) {
    let num = [0, 1, 0, 2, 5]
    print(s.isStraight(num))
}
