//
//  073.矩阵置零.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/21.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。

 示例 1:
 输入:
 [
   [1,1,1],
   [1,0,1],
   [1,1,1]
 ]
 输出:
 [
   [1,0,1],
   [0,0,0],
   [1,0,1]
 ]
 
 示例 2:
 输入:
 [
   [0,1,2,0],
   [3,4,5,2],
   [1,3,1,5]
 ]
 输出:
 [
   [0,0,0,0],
   [0,4,5,0],
   [0,3,1,0]
 ]
 
 进阶:
 一个直接的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
 你能想出一个常数空间的解决方案吗？
 */

extension Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let n = matrix.count
        if n == 0 {
            return
        }
        let m = matrix[0].count
        
        var top = false
        var left = false
        for i in 0..<n {
            if matrix[i][0] == 0 {
                left = true
            }
        }
        for j in 0..<m {
            if matrix[0][j] == 0 {
                top = true
            }
        }
        
        for i in 1..<n {
            for j in 1..<m {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in 1..<n {
            for j in 1..<m {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }

        if left {
            for i in 0..<n {
                matrix[i][0] = 0
            }
        }
        if top {
            for j in 0..<m {
                matrix[0][j] = 0
            }
        }
    }
}

func test073(s: Solution) {
    var matrix = [
        [0,1,2,0],
        [3,4,5,2],
        [1,3,1,5]
    ]
//    var matrix = [[1, 0]]
    
    s.setZeroes(&matrix)
    print(matrix)
}
