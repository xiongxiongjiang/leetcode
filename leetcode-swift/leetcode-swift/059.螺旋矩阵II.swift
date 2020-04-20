//
//  059.螺旋矩阵II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。

 示例:

 输入: 3
 输出:
 [
  [ 1, 2, 3 ],
  [ 8, 9, 4 ],
  [ 7, 6, 5 ]
 ]
 */

extension Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var top = 0, left = 0
        var bottom = n - 1, right = n - 1
        var nums = [Int]()
        for i in 1...n*n {
            nums.append(i)
        }
        var index = 0
        while true {
            for i in left...right {
                res[top][i] = nums[index]
                index += 1
            }
            top += 1
            if top > bottom {
                break
            }
            for i in top...bottom {
                res[i][right] = nums[index]
                index += 1
            }
            right -= 1
            if right < left {
                break
            }
            for i in stride(from: right, through: left, by: -1) {
                res[bottom][i] = nums[index]
                index += 1
            }
            bottom -= 1
            if bottom < top {
                break
            }
            for i in stride(from: bottom, through: top, by: -1) {
                res[i][left] = nums[index]
                index += 1
            }
            left += 1
            if left > right {
                break
            }
        }
        return res
    }
}

func test059(s: Solution) {
    let n = 4
    print(s.generateMatrix(n))
}
