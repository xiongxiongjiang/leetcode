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
        var stack = [Int]()
        var maxArea = 0
        stack.append(-1)
        for i in 0..<heights.count {
            //如果当前高度比栈顶元素矮
            while stack.last != -1 && heights[i] < heights[stack.last!] {
                //因为栈是递增的
                let length = heights[stack.removeLast()]
                let width = i - stack.last! - 1
                print(length, width)
                maxArea = max(length * width, maxArea)
            }
            stack.append(i)
        }
        while stack.last != -1 {
            maxArea = max(heights[stack.removeLast()] * (heights.count - stack.last! - 1), maxArea)
        }
        return maxArea
    }
}

func test084(s: Solution) {
//    let heights = [2,1,5,6,2,3]
    let heights = [6, 7, 5, 2, 4, 5, 9, 3]
    print(s.largestRectangleArea(heights))
}
