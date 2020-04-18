//
//  011.盛最多水的容器.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/18.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器，且 n 的值至少为 2。

 示例：

 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 */

extension Solution {
    
    //解题思路 一个范围(left,right)内能接到的最多雨水，等于min(left,right)*t,t为left和right之间的距离
    //假设left小于right，right向左移动，t减少，而min(left,right)不变，所以能接到的雨水变少。
    //所以每次只需要移动较小边来计算当前能接到的最多的雨水，然后求最大值
    func maxArea(_ height: [Int]) -> Int {
        var res = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            let curr = (right - left) * min(height[left], height[right])
            res = max(res, curr)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}

func test011(s: Solution) {
    let height = [1,8,6,2,5,4,8,3,7]
    print(s.maxArea(height))
}
