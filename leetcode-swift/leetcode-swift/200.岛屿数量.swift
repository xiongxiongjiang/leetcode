//
//  200.岛屿数量.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation


/*
 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

 岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。

 此外，你可以假设该网格的四条边均被水包围。


 示例 1:

 输入:
 [
 ['1','1','1','1','0'],
 ['1','1','0','1','0'],
 ['1','1','0','0','0'],
 ['0','0','0','0','0']
 ]
 输出: 1

 示例 2:
 输入:
 [
 ['1','1','0','0','0'],
 ['1','1','0','0','0'],
 ['0','0','1','0','0'],
 ['0','0','0','1','1']
 ]
 输出: 3
 解释: 每座岛屿只能由水平和/或竖直方向上相邻的陆地连接而成。
 */

extension Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        //行数
        let nr = grid.count
        if nr == 0 {
            return 0
        }
        //列数
        let nc = grid[0].count
        var res = 0
        for row in 0..<nr {
            for col in 0..<nc {
                if grid[row][col] == "1" {
                    res += 1
                    numIslandsDfs(grid: &grid, row: row, col: col)
                }
            }
        }
        return res
    }
    
    private func numIslandsDfs(grid: inout [[Character]], row: Int, col: Int) {
        let nr = grid.count
        let nc = grid[0].count
        grid[row][col] = "0"
        if row - 1 >= 0 && grid[row - 1][col] == "1" {
            numIslandsDfs(grid: &grid, row: row - 1, col: col)
        }
        if row + 1 < nr && grid[row + 1][col] == "1" {
            numIslandsDfs(grid: &grid, row: row + 1, col: col)
        }
        if col - 1 >= 0 && grid[row][col - 1] == "1" {
            numIslandsDfs(grid: &grid, row: row, col: col - 1)
        }
        if col + 1 < nc && grid[row][col + 1] == "1" {
            numIslandsDfs(grid: &grid, row: row, col: col + 1)
        }
    }
}


func test200(s: Solution) {
    /*
     11000
     11000
     00100
     00011
     */
    let grid: [[Character]] = [
        ["1","1","0","0","0"],
        ["1","1","0","0","0"],
        ["0","0","1","0","0"],
        ["0","0","0","0","0"],
        ["0","0","0","1","1"]
    ]
    print(s.numIslands(grid))
}
