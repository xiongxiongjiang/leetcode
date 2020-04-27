//
//  1004.最大连续1的个数III.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/27.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个由若干 0 和 1 组成的数组 A，我们最多可以将 K 个值从 0 变成 1 。
 返回仅包含 1 的最长（连续）子数组的长度。

 示例 1：
 输入：A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
 输出：6
 解释：
 [1,1,1,0,0,1,1,1,1,1,1]
 粗体数字从 0 翻转到 1，最长的子数组长度为 6。
 
 示例 2：
 输入：A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
 输出：10
 解释：
 [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 粗体数字从 0 翻转到 1，最长的子数组长度为 10。

 提示：
 1 <= A.length <= 20000
 0 <= K <= A.length
 A[i] 为 0 或 1
 */

extension Solution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var res = 0
        var left = 0
        var right = 0
        //0的数量
        var count = 0
        let size = A.count
        while right < size {
            if A[right] == 0 {
                count += 1
            }
            right += 1
            while count > K {
                if A[left] == 0 {
                    count -= 1
                }
                left += 1
            }
            res = max(res, right - left)
        }
        return res
    }
}

func test1004(s: Solution) {
    let a = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1]
    let k = 3
    print(s.longestOnes(a, k))
}
