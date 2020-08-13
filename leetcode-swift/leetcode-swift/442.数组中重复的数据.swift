//
//  442.数组中重复的数据.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个整数数组 a，其中1 ≤ a[i] ≤ n （n为数组长度）, 其中有些元素出现两次而其他元素出现一次。
 找到所有出现两次的元素。
 你可以不用到任何额外空间并在O(n)时间复杂度内解决这个问题吗？

 示例：
 输入:
 [4,3,2,7,8,2,3,1]
 输出:
 [2,3]
 */

extension Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return []
        }
        var nums = nums
        var result = [Int]()
        for num in nums {
            //每次都取负值
            nums[num - 1] = -nums[num - 1]
            //如果负值后还大于0，说明出现了两次
            if (nums[num - 1] > 0) {
                result.append(num)
            }
        }
        return result
    }
}

func test442(s: Solution) {
    let nums =  [4,3,2,7,8,2,3,1]
    print(s.findDuplicates(nums))
}
