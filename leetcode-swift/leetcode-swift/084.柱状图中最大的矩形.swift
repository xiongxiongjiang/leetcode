//
//  084.柱状图中最大的矩形.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/27.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
 求在该柱状图中，能够勾勒出来的矩形的最大面积。
 
 示例:

 输入: [2,1,5,6,2,3]
 输出: 10
 */

extension Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var count = heights.count
        if count == 0 {
            return 0
        }
        if count == 1 {
            return heights.first!
        }
        var maxArea = 0
        var heights = heights
        //引入哨兵，这样栈就不需要判空
        heights = [0] + heights + [0]
        count += 2
        var stack = [0]
        //栈存入的是下标
        for i in 1..<count {
            //如果当前高度比栈顶元素矮（也就是数组的最后一个）
            while heights[i] < heights[stack.last!] {
                //因为栈是从前往后递增的
                let length = heights[stack.removeLast()]
                let width = i - stack.last! - 1
                maxArea = max(length * width, maxArea)
            }
            stack.append(i)
        }
        return maxArea
    }
}

func test084(s: Solution) {
//    let heights = [2,1,5,6,2,3]
    let heights = [6, 7, 5, 2, 4, 5, 9, 3]
    print(s.largestRectangleArea(heights))
}
