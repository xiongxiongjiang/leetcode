//
//  091.解码方法.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 一条包含字母 A-Z 的消息通过以下方式进行了编码：

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 给定一个只包含数字的非空字符串，请计算解码方法的总数。

 示例 1:
 输入: "12"
 输出: 2
 解释: 它可以解码为 "AB"（1 2）或者 "L"（12）。
 
 示例 2:
 输入: "226"
 输出: 3
 解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
 */

extension Solution {
    func numDecodings(_ s: String) -> Int {
        //没有0开头的编码
        if s.first! == "0" {
            return 0
        }
        let arr = Array(s).map { (sub) -> String in
            return String(sub)
        }
        let count = arr.count
        var curr = 1, total = 1
        for i in 1..<count {
            let tmp = total
            if arr[i] == "0" {
                if arr[i-1] == "1" || arr[i-1] == "2" {
                    //若要有解，当前0必须和前一个1或者0结合
                    total = curr
                } else {
                    //连续两个0，无解
                    return 0
                }
            } else if arr[i-1] == "1" || (arr[i-1] == "2" && Int(arr[i])! >= 1 && Int(arr[i])! <= 6) {
                total = total + curr
            }
            curr = tmp
        }
        return total
    }
}

func test091(s: Solution) {
    let str = "00"
    print(s.numDecodings(str))
}
