//
//  118.杨辉三角.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。

 在杨辉三角中，每个数是它左上方和右上方的数的和。

 示例:

 输入: 5
 输出:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 */


extension Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows < 1 {
            return []
        }
        var res = [[Int]]()
        var dp = [[Int]](repeating: [Int](repeating: 1, count: numRows), count: numRows)
        for i in 0..<numRows {
            for j in 0..<numRows {
                dp[i][0] = 1
                if i == j {
                    dp[i][j] = 1
                } else if i >= 1 && j >= 1 {
                    dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
                }
            }
        }
        for rows in 0..<numRows {
            res.append(Array(dp[rows][0...rows]))
        }
        return res
    }
}

func test118(s: Solution) {
    print(s.generate(10))
}
