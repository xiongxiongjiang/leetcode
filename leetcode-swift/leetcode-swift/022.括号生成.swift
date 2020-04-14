//
//  022.括号生成.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 
 示例：
 输入：n = 3
 输出：[
        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
      ]
 */

extension Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        var track = String()
        backTrackGenerateParenthesis(n: n, open: 0, close: 0, track: &track, res: &res)
        return res
    }
    
    private func backTrackGenerateParenthesis(n: Int, open: Int, close: Int, track: inout String, res: inout [String]) {
        if track.count == n * 2 {
            res.append(track)
            return
        }
        if open < n {
            track.append("(")
            backTrackGenerateParenthesis(n: n, open: open + 1, close: close, track: &track, res: &res)
            track.removeLast()
        }
        if open > close {
            track.append(")")
            backTrackGenerateParenthesis(n: n, open: open, close: close + 1, track: &track, res: &res)
            track.removeLast()
        }
    }
}


func test022(s: Solution) {
    let n = 3
    print(s.generateParenthesis(n))
}
