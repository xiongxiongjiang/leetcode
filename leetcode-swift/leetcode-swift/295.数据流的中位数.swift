//
//  295.数据流的中位数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/11.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 中位数是有序列表中间的数。如果列表长度是偶数，中位数则是中间两个数的平均值。

 例如，

 [2,3,4] 的中位数是 3

 [2,3] 的中位数是 (2 + 3) / 2 = 2.5

 设计一个支持以下两种操作的数据结构：

 void addNum(int num) - 从数据流中添加一个整数到数据结构中。
 double findMedian() - 返回目前所有元素的中位数。
 
 示例：
 addNum(1)
 addNum(2)
 findMedian() -> 1.5
 addNum(3)
 findMedian() -> 2
 
 进阶:
 如果数据流中所有整数都在 0 到 100 范围内，你将如何优化你的算法？
 如果数据流中 99% 的整数都在 0 到 100 范围内，你将如何优化你的算法？
 */

class MedianFinder {
    
    var nums : [Int]

    /** initialize your data structure here. */
    init() {
        nums = [Int]()
    }

    func addNum(_ num: Int) {
        if nums.isEmpty {
            nums.append(num)
            return
        }

        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] < num {
                left = mid + 1
            }else if nums[mid] == num {
                left = mid
                break
            }else {
                right = mid - 1
            }
        }

        nums.insert(num, at: left)
    }

    func findMedian() -> Double {
        if nums.isEmpty {
            return 0
        }
        if nums.count % 2 == 1 {
            return Double(nums[nums.count / 2])
        } else {
            let r1 = nums[nums.count / 2]
            let r2 = nums[nums.count / 2 - 1]
            return Double(r1 + r2) / 2
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
