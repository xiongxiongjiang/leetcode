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
        var res = ""
        var level = [String]()
        var carry = 0
        var number1 = num1
        var number2 = num2
        if number1.count < number2.count {
            number1 = num2
            number2 = num1
        }
        for char2 in number1.reversed() {
            if char2 == "0" {
                level.append("0")
                continue
            }
            var col = ""
            for char1 in number2.reversed() {
                let n2 = charToInt(char: char2)
                let n1 = charToInt(char: char1)
                let tmp = n1 * n2 + carry
                let curr = tmp % 10
                carry = tmp / 10
                col = "\(curr)" + col
            }
            if carry != 0 {
                col = "\(carry)" + col
            }
            level.append(col)
            carry = 0
        }
        var maxColCount = 0
        for i in stride(from: level.count - 1, through: 0, by: -1) {
            if level[i] == "0" {
                continue
            }
            if i == level.count - 1 {
                let maxCol = level[i] + String(repeating: "0", count: i)
                maxColCount = maxCol.count
                level[i] = maxCol
                continue
            }
            level[i] = String(repeating: "0", count: maxColCount - level[i].count - i) + level[i] + String(repeating: "0", count: i)
        }
        for i in stride(from: maxColCount - 1, through: 0, by: -1) {
            var sum = 0
            for col in level {
                if col == "0" {
                    continue
                }
                let idx = col.index(col.startIndex, offsetBy: i)
                sum += charToInt(char: col[idx])
            }
            sum += carry
            let curr = sum % 10
            carry = sum / 10
            res = "\(curr)" + res
        }
        if carry != 0 {
            res = "\(carry)" + res
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
//    let num1 = "123"
//    let num2 = "456"
//    let num1 = "9"
//    let num2 = "99"
    print(s.multiply(num1, num2))
}
