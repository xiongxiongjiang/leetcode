//
//  215. 数组中的第K个最大元素.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

 示例 1:
 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 
 示例 2:
 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 输出: 4
 
 说明:
 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 */


extension Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        //还可以用最大堆解答， 待补充。但是从效率上来说，库函数反而是最快的
        return nums.sorted(by: >)[k - 1]
    }
}

func test215(s: Solution) {
    print(s.findKthLargest([3,2,3,1,2,4,5,5,6], 4))
}
