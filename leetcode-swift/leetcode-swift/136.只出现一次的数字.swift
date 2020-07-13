//
//  136. 只出现一次的数字.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 说明：
 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:
 输入: [2,2,1]
 输出: 1
 
 示例 2:
 输入: [4,1,2,1,2]
 输出: 4
 */

extension Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        //任何数和 00 做异或运算，结果仍然是原来的数，即 a ⊕ 0 = a
        //任何数和其自身做异或运算，结果是 0，即 a ⊕ a = 0
        //异或运算满足交换律和结合律，即 a ⊕ b ⊕ a = b ⊕ a ⊕ a = b ⊕ (a ⊕ a) = b ⊕ 0 = b
        var a = 0
        for num in nums {
            a = a ^ num
        }
        return a
    }
}

func test136(s: Solution) {
    let nums = [4, 1, 2, 1, 2]
    print(s.singleNumber(nums))
}
