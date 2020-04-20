//
//  054.螺旋矩阵.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。

 示例 1:
 输入:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 输出: [1,2,3,6,9,8,7,4,5]
 
 示例 2:
 输入:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 输出: [1,2,3,4,8,12,11,10,9,5,6,7]
 */

extension Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        if matrix.isEmpty {
            return res
        }
        var top = 0, left = 0
        var bottom = matrix.count - 1
        var right = matrix[0].count - 1
        while true {
            for i in left...right {
                res.append(matrix[top][i])
            }
            top += 1
            if top > bottom {
                break
            }
            for i in top...bottom {
                res.append(matrix[i][right])
            }
            right -= 1
            if right < left {
                break
            }
            for i in stride(from: right, through: left, by: -1) {
                res.append(matrix[bottom][i])
            }
            bottom -= 1
            if bottom < top {
                break
            }
            for i in stride(from: bottom, through: top, by: -1) {
                res.append(matrix[i][left])
            }
            left += 1
            if left > right {
                break
            }
        }
        return res
    }
}

func test054(s: Solution) {
    let matrix =  [
      [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12]
    ]
    print(s.spiralOrder(matrix))
}
