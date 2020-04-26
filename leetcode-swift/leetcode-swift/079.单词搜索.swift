//
//  079.单词搜索.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/26.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二维网格和一个单词，找出该单词是否存在于网格中。
 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

 示例:
 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]
 给定 word = "ABCCED", 返回 true
 给定 word = "SEE", 返回 true
 给定 word = "ABCB", 返回 false
  
 提示：
 board 和 word 中只包含大写和小写英文字母。
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 1 <= word.length <= 10^3
 */

extension Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        var letters = Array(word)
        let n = board.count
        guard n > 0 else {
            return false
        }
        let m = board[0].count
        guard board[0].count > 0 else {
            return false
        }
        //dp数组是访问状况
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                if existDfs(board: &board, letters: &letters, dp: &dp, i: i, j: j, index: 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func existDfs(board: inout [[Character]], letters: inout [Character], dp: inout [[Bool]], i: Int, j: Int, index: Int) -> Bool {
        if board[i][j] == letters[index] {
            dp[i][j] = true
            if index >= letters.count - 1 {
                return true
            }
            //上
            if i > 0 && dp[i-1][j] == false && existDfs(board: &board, letters: &letters, dp: &dp, i: i-1, j: j, index: index + 1) {
                return true
            }
            //下
            if i < board.count - 1 && dp[i+1][j] == false && existDfs(board: &board, letters: &letters, dp: &dp, i: i+1, j: j, index: index + 1) {
                return true
            }
            //左
            if j > 0 && dp[i][j-1] == false && existDfs(board: &board, letters: &letters, dp: &dp, i: i, j: j-1, index: index + 1) {
                return true
            }
            //右
            if j < board[0].count - 1 && dp[i][j+1] == false && existDfs(board: &board, letters: &letters, dp: &dp, i: i, j: j+1, index: index + 1) {
                return true
            }
            dp[i][j] = false
        }
        return false
    }
}

func test079(s: Solution) {
    let board: [[Character]] = [
        ["A","B","C","E"],
        ["S","F","C","S"],
        ["A","D","E","E"]
    ]
//    let word = "ABCCED"
    let word = "FCE"
    print(s.exist(board, word))
}
