//
//  200.岛屿数量.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

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
