//
//  240.搜索二维矩阵II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/28.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target。该矩阵具有以下特性：
 每行的元素从左到右升序排列。
 每列的元素从上到下升序排列。
 
 示例:
 现有矩阵 matrix 如下：
 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。
 给定 target = 20，返回 false。
 */

extension Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var n = matrix.count
        if n == 0 {
            return false
        }
        var m = matrix.first!.count
        if m == 0 {
            return false
        }
        n = 0
        m -= 1
        while n < matrix.count && m >= 0 {
            let curr = matrix[n][m]
            if curr > target {
                m -= 1
            } else if curr < target {
                n += 1
            } else {
                return true
            }
        }
        return false
    }
}

func test240(s: Solution) {
    let matrix =  [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    print(s.searchMatrix(matrix, 5))
}
