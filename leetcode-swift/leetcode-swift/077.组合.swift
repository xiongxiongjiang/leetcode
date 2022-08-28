//
//  077.组合.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

 示例:

 输入: n = 4, k = 2
 输出:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 */

extension Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var track = [Int]()
        var res = [[Int]]()
        backTrackCombine(n: n, start: 1, k: k, track: &track, res: &res)
        return res
    }
    
    func backTrackCombine(n: Int, start: Int, k: Int, track: inout [Int], res: inout [[Int]]) {
        //k决定决策树的高度，n决定树的宽度
        if track.count == k {
            res.append(track)
            return
        }
        if start > n {
            return
        }
        for i in start...n {
            track.append(i)
            backTrackCombine(n: n, start: i + 1, k: k, track: &track, res: &res)
            track.removeLast()
        }
    }
}

func test077(s: Solution) {
    let n = 4
    let k = 2
    print(s.combine(n, k))
}


class Solution77 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var stack = [Int]()
        var res = [[Int]]()
        dfs(n: n, k: k, stack: &stack, res: &res, start: 1)
        return res
    }
    
    func dfs(n: Int, k: Int, stack: inout [Int], res: inout [[Int]], start: Int) {
        if stack.count == k {
            res.append(stack)
            return
        }
        for i in start...n {
            stack.append(i)
            dfs(n: n, k: k, stack: &stack, res: &res, start: i+1)
            stack.removeLast()
        }
    }
}
