//
//  167.两数之和II-输入有序数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/22.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。

 说明:
 返回的下标值（index1 和 index2）不是从零开始的。
 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
 
 示例:
 输入: numbers = [2, 7, 11, 15], target = 9
 输出: [1,2]
 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
 */

extension Solution {
    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count >= 2 else {
            return []
        }
        var first = 0
        var last = numbers.count - 1
        while last > first {
            if numbers[first] + numbers[last] > target {
                last -= 1
            } else if numbers[first] + numbers[last] < target {
                first += 1
            } else {
                return [first + 1, last + 1]
            }
        }
        return []
    }
}

func test167(s: Solution) {
    let numbers = [1,1], target = 3
    print(s.twoSum2(numbers, target))
}
