//
//  001. 两数之和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */

extension Solution {
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, index]
            } else {
                dict[num] = index
            }
        }
        fatalError("No valid output!")
    }
}

func test001(s: Solution) {
    let nums = [2, 7, 11, 15]
    print(s.twoSum(nums, 9))
}
