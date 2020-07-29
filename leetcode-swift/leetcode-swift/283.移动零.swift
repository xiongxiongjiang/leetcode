//
//  283.移动零.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/27.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 
 说明:
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */

extension Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        var j = 0
        //遇到一个非零元素时，我们需要交换当前指针和慢速指针指向的元素，然后前进两个指针。如果它是零元素，我们只前进当前指针
        //确保慢指针j前面全部非零且保持相对有序
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, j)
                j += 1
            }
        }
    }
}

func test283(s: Solution) {
    var nums = [0,1,0,3,12]
//    var nums = [1, 2]
    s.moveZeroes(&nums)
    print(nums)
}
