//
//  051.N皇后.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/13.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
 给定一个整数 n，返回所有不同的 n 皇后问题的解决方案。
 每一种解法包含一个明确的 n 皇后问题的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

 示例:
 输入: 4
 输出: [
  [".Q..",  // 解法 1
   "...Q",
   "Q...",
   "..Q."],

  ["..Q.",  // 解法 2
   "Q...",
   "...Q",
   ".Q.."]
 ]
 解释: 4 皇后问题存在两个不同的解法。
 */

extension Solution {
//    func solveNQueens(_ n: Int) -> [[String]] {
//        var res = [[String]]()
//        var board = [String](repeating: String(repeating: ".", count: n), count: n)
//        backTrackNQueens(board: &board, row: 0, res: &res)
//        return res
//    }
//
//    func backTrackNQueens(board: inout [String], row: Int, res: inout [[String]]) {
//        //row 超过 board 的最后一行
//        if row == board.count {
//            res.append(board)
//            return
//        }
//        let n = board.count
//        for col in 0..<n {
//            print(col)
//            if isValidQueen(board: &board, row: row, col: col) == false {
//                continue
//            }
//            board[row].replaceAt(index: col, subString: "Q")
//            backTrackNQueens(board: &board, row: row + 1, res: &res)
//            board[row].replaceAt(index: col, subString: ".")
//        }
//    }
//
//    func isValidQueen(board: inout [String], row: Int, col: Int) -> Bool {
//        let n = board.count
//        //垂直方向
//        for i in 0..<n {
//            if board[i][col] == "Q" {
//                return false
//            }
//        }
//        //右上角
//        for i in stride(from: row - 1, through: 0, by: -1) {
//            for j in (col + 1)..<n {
//                if board[i][j] == "Q" {
//                    return false
//                }
//            }
//        }
//        //左上角
//        for i in stride(from: row - 1, through: 0, by: -1) {
//            for j in stride(from: col - 1, through: 0, by: -1) {
//                if board[i][j] == "Q" {
//                    return false
//                }
//            }
//        }
//        return true
//    }
    
    func solveNQueens(_ n: Int) -> [[String]] {
        guard n > 0 else {
            return []
        }
        var results = [[String]]()
        var cols = [Int]()
        cols.reserveCapacity(n)
        dfsHelper(n, &cols, &results)
        return results
    }

    fileprivate func dfsHelper(_ n: Int, _ cols: inout [Int], _ results: inout [[String]]) {
        if cols.count == n {
            results.append(draw(cols))
            return
        }

        for i in 0..<n {
            guard isValid(cols, i) else {
                continue
            }
            cols.append(i)
            dfsHelper(n, &cols, &results)
            cols.removeLast()
        }
    }

    fileprivate func isValid(_ cols: [Int], _ colIndex: Int) -> Bool {
        for rowIndex in 0..<cols.count {
            if colIndex == cols[rowIndex] {
                return false
            }
            if cols.count - rowIndex == colIndex - cols[rowIndex] {
                return false
            }
            if rowIndex - cols.count == colIndex - cols[rowIndex] {
                return false
            }
        }
        return true
    }

    fileprivate func draw(_ cols: [Int]) -> [String] {
        var result = [String]()
        for rowIndex in 0..<cols.count {
            var row = ""
            for j in 0..<cols.count {
                row += cols[rowIndex] == j ? "Q" : "."
            }
            result.append(row)
        }
        return result
    }
}

extension String {
    subscript (i: Int) -> Character? {
        guard i < self.count else {
            return nil
        }
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    mutating func replaceAt(index: Int, subString: String) {
        let range = self.index(self.startIndex, offsetBy: index)..<self.index(self.startIndex, offsetBy: index + 1)
        self = self.replacingCharacters(in: range, with: subString)
    }
}


func test051(s: Solution) {
    print(s.solveNQueens(9))
}
