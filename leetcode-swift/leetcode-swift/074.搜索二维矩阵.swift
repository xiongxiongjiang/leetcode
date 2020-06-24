//
//  074.搜索二维矩阵.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/23.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。
 
 示例 1:
 输入:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 3
 输出: true
 
 示例 2:
 输入:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 13
 输出: false
 */

extension Solution {
    func searchMatrix1(_ matrix: [[Int]], _ target: Int) -> Bool {
        let n = matrix.count
        if n == 0 {
            return false
        }
        let m = matrix.first!.count
        if m == 0 {
            return false
        }
        if matrix[n - 1][m - 1] < target {
            return false
        }
        var start = 0, end = m * n - 1
        while start < end {
            let mid = start + (end - start) / 2
            //一维转二维下标
            let x = mid % m
            let y = mid / m
            if matrix[y][x] == target {
                return true
            } else if matrix[y][x] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return false
    }
}

func test074(s: Solution) {
//    let matrix = [
//      [1,   3,  5,  7],
//      [10, 11, 16, 20],
//      [23, 30, 34, 50]
//    ]
//    let target = 3
    let matrix = [[1, 3]]
    let target = 2
    print(s.searchMatrix1(matrix, target))
}
