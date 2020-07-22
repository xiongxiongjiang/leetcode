//
//  120.三角形最小路径和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。

 相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。

 例如，给定三角形：

 [
      [2],
     [3,4],
    [6,5,7],
   [4,1,8,3]
 ]
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。

 说明：
 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。
 */

extension Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        res[0][0] = triangle[0][0]
        for i in 1..<n {
            res[i][0] = res[i-1][0] + triangle[i][0]
            for j in 1..<i {
                res[i][j] = min(res[i-1][j-1], res[i-1][j]) + triangle[i][j]
            }
            res[i][i] = res[i][i-1] + triangle[i][i]
        }
        return res[0][0]
    }
}

func test120(s: Solution) {
//    let triangle = [
//         [2],
//        [3,4],
//       [6,5,7],
//      [4,1,8,3]
//    ]
    let tr = [
        [-1],
        [2,3],
        [1,-1,-3]
    ]
    print(s.minimumTotal(tr))
}
