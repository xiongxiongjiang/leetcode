//
//  042. 接雨水.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。

 示例:
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 */

extension Solution {
    func trap(_ height: [Int]) -> Int {
        let count = height.count
        if count == 0 {
            return 0
        }
        var maxLeft = Array(repeating: 0, count: count)
        var maxRight = Array(repeating: 0, count: count)
        maxLeft[0] = height.first ?? 0
        maxRight[height.count - 1] = height.last ?? 0
        for i in 1 ..< count {
            maxLeft[i] = max(height[i], maxLeft[i - 1])
        }
        for i in stride(from: count - 2, through: 0, by: -1) {
            maxRight[i] = max(height[i], maxRight[i + 1])
        }
        var res = 0
        for i in 0 ..< count {
            //每一个格子能接的雨水等于他左边最高和右边最高中最小的那个减去自身高度
            res += min(maxLeft[i], maxRight[i]) - height[i]
        }
        return res
    }
}

func test042(s: Solution) {
    let height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
    print(s.trap(height))
}
