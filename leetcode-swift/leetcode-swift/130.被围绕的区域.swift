//
//  130.被围绕的区域.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/23.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。

 找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。

 示例:

 X X X X
 X O O X
 X X O X
 X O X X
 
 运行你的函数后，矩阵变为：
 X X X X
 X X X X
 X X X X
 X O X X
 
 解释:
 被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。
 */

extension Solution {
    func solve(_ board: inout [[Character]]) {
        if board.count == 0 {
            return
        }
        let m = board.count
        let n = board[0].count
        for i in 0..<m {
            for j in 0..<n {
                let isEdge = (i==0) || (j==0) || (i==m-1) || (j==n-1)
                if isEdge && board[i][j] == "O" {
                    //1. 与边界联通的O都换成#
                    solveAreaDfs(board: &board, i: i, j: j, n: n, m: m)
                }
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                //2. 把剩余所有的O换成X
                if board[i][j] == Character("O") {
                    board[i][j] = Character("X")
                }
                //3. 再把所有的#换回O
                if board[i][j] == Character("#") {
                    board[i][j] = Character("O")
                }
            }
        }
    }
    
    func solveAreaDfs(board: inout [[Character]], i: Int, j: Int, n: Int, m: Int) {
        if i<0 || j<0 || i>=m || j>=n || board[i][j] == Character("X") || board[i][j] == Character("#") {
            return
        }
        board[i][j] = Character("#")
        //上
        solveAreaDfs(board: &board, i: i-1, j: j, n: n, m: m)
        //左
        solveAreaDfs(board: &board, i: i, j: j-1, n: n, m: m)
        //下
        solveAreaDfs(board: &board, i: i+1, j: j, n: n, m: m)
        //右
        solveAreaDfs(board: &board, i: i, j: j+1, n: n, m: m)
    }
}
