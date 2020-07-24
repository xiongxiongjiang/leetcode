//
//  119.杨辉三角II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/22.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
 
 在杨辉三角中，每个数是它左上方和右上方的数的和。

 示例:
 输入: 3
 输出: [1,3,3,1]
 
 进阶：
 你可以优化你的算法到 O(k) 空间复杂度吗？
 */

extension Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        //第rowIndex行是rowIndex+1个数字
        var res = [Int](repeating: 1, count: rowIndex + 1)
        for i in 0..<rowIndex+1 {
            res[i] = 1
            for j in stride(from: i, to: 1, by: -1) {
                res[j-1] = res[j-2] + res[j-1]
            }
        }
        return res
    }
}

func test119(s: Solution) {
    print(s.getRow(4))
}
