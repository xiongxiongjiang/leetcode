//
//  159.至多包含两个不同字符的最长子串.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/26.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个字符串 s ，找出 至多 包含两个不同字符的最长子串 t ，并返回该子串的长度。

 示例 1:
 输入: "eceba"
 输出: 3
 解释: t 是 "ece"，长度为3。
 
 示例 2:
 输入: "ccaabbb"
 输出: 5
 解释: t 是 "aabbb"，长度为5。
 */

extension Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        let arr = Array(s)
        if arr.count < 3 {
            return arr.count
        }
        var start = 0, end = 0
        //键为字母，值存放最后一次遍历到在数组的下标
        var maxLen = 0
        var map = [Character: Int]()
        while end < arr.count {
            if map.keys.count < 3 {
                map[arr[end]] = end
                end += 1
            }
            if map.keys.count == 3 {
                let delIndex = map.values.min() ?? 0
                map.removeValue(forKey: arr[delIndex])
                start = delIndex + 1
            }
            maxLen = max(maxLen, end - start)
        }
        return maxLen
    }
}

func test159(s: Solution) {
    let str = "eceba"
    print(s.lengthOfLongestSubstringTwoDistinct(str))
}
