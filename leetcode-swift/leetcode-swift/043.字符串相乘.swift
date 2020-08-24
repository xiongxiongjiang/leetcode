//
//  043.字符串相乘.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/15.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。

 示例 1:
 输入: num1 = "2", num2 = "3"
 输出: "6"
 
 示例 2:
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：

 num1 和 num2 的长度小于110。
 num1 和 num2 只包含数字 0-9。
 num1 和 num2 均不以零开头，除非是数字 0 本身。
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 */

extension Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        let m = num1.count, n = num2.count
        let nums1Arr = Array(num1), nums2Arr = Array(num2)
        var ansArr = [Int](repeating: 0, count: m + n)
        for i in stride(from: m-1, through: 0, by: -1) {
            let x = charToInt(char: nums1Arr[i])
            for j in stride(from: n-1, through: 0, by: -1) {
                let y = charToInt(char: nums2Arr[j])
                ansArr[i+j+1] += x * y
            }
        }
        for i in stride(from: m+n-1, to: 0, by: -1) {
            ansArr[i-1] += ansArr[i] / 10
            ansArr[i] %= 10
        }
        var index = ansArr[0] == 0 ? 1 : 0
        var res = ""
        while index < m + n {
            res += String(ansArr[index])
            index += 1
        }
        return res
    }
    
    private func charToInt(char: Character) -> Int {
        return Int(String(char)) ?? 0
    }
}

func test043(s: Solution) {
    let num1 = "498828660196"
    let num2 = "840477629533"
    //419254329864656431168468
//    let num1 = "123"
//    let num2 = "456"
//    let num1 = "9"
//    let num2 = "99"
    print(s.multiply(num1, num2))
}
