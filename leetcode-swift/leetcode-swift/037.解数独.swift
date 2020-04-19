//
//  037.解数独.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/18.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 编写一个程序，通过已填充的空格来解决数独问题。
 一个数独的解法需遵循如下规则：
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 空白格用 '.' 表示。
 
 Note:
 给定的数独序列只包含数字 1-9 和字符 '.' 。
 你可以假设给定的数独只有唯一解。
 给定数独永远是 9x9 形式的。
 */

extension Solution {
    
    func solveSudoku(_ board: inout [[Character]]) {
        guard board.count != 0 || board[0].count != 0 else {
            return
        }
        _ = helper(&board)
        print(board)
    }

    private func helper(_ board: inout [[Character]]) -> Bool {
        let m = board.count, n = board[0].count

        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "." {
                    for num in 1...9 {
                        if isValid(board, i, j, Character(String(num))) {
                            board[i][j] = Character(String(num))
                            if helper(&board) {
                                return true
                            } else {
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
            }
        }

        return true
    }
        
    private func isValid(_ board: [[Character]], _ i: Int, _ j: Int, _ num: Character) -> Bool {
        let m = board.count, n = board[0].count
    
        // check row
        for x in 0..<n {
            if board[i][x] == num {
                return false
            }
        }
        
        // check col
        for y in 0..<m {
            if board[y][j] == num {
                return false
            }
        }
        
        // check square
        for x in i / 3 * 3..<i / 3 * 3 + 3 {
            for y in j / 3 * 3..<j / 3 * 3 + 3 {
                if board[x][y] == num {
                    return false
                }
            }
        }
        
        return true
    }
}

func test037(s: Solution) {
    var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    s.solveSudoku(&board)
}
