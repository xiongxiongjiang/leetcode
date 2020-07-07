//
//  剑指Offer38.字符串的排列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 输入一个字符串，打印出该字符串中字符的所有排列。

 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

 示例:
 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]

 限制：
 1 <= s 的长度 <= 8
 */

extension Solution {
    func permutation(_ s: String) -> [String] {
        var res = [String]()
        var sArr = [String]()
        for char in s {
            sArr.append(String(char))
        }
        backTrack61(res: &res, sArr: &sArr, start: 0)
        return Array(Set(res))
    }
    
    func backTrack61(res: inout [String], sArr: inout [String], start: Int) {
        if start == sArr.count {
            res.append(sArr.joined())
            return
        }
        for i in start..<sArr.count {
            sArr.swapAt(start, i)
            backTrack61(res: &res, sArr: &sArr, start: start + 1)
            sArr.swapAt(start, i)
        }
    }
}

func testOffer38(s: Solution) {
    print(s.permutation("abc"))
}
