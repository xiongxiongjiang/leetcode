//
//  067. 二进制求和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 给定两个二进制字符串，返回他们的和（用二进制表示）。

 输入为非空字符串且只包含数字 1 和 0。

 示例 1:
 输入: a = "11", b = "1"
 输出: "100"
 
 示例 2:
 输入: a = "1010", b = "1011"
 输出: "10101"
 */

extension Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var A = a
        var B = b
        var countA = A.count
        var countB = B.count
        //先让A变大
        if countA < countB {
            swap(&A, &B)
            swap(&countA, &countB)
        }
        //如果A比B长，B补0
        if countA > countB {
            B = String.init(repeating: "0", count: countA - countB) + B
        }
        var pre = 0, cur = 0
        var res = ""
        while countA != 0 {
            let aLast = Int(String(A.removeLast())) ?? 0
            let bLast = Int(String(B.removeLast())) ?? 0
            cur = aLast ^ bLast ^ pre
            if aLast + bLast + pre >= 2 {
                pre = 1
            } else {
                pre = 0
            }
            res = String(cur) + res
            countA -= 1
        }
        if pre == 1 {
            res = String(1) + res
        }
        return res
    }
    
    func binary2dec(num: String) -> Int {
        var sum = 0
        for c in num {
            sum = sum * 2 + Int("\(c)")!
        }
        return sum
    }
}

func test067(s: Solution) {
    //let a = "1010"
    //let b = "101110"
//    let a = "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101"
//    let b = "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"
    let a = "11"
    let b = "1"
    print(s.addBinary(a, b))
}
