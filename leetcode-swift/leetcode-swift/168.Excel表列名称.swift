//
//  168.Excel表列名称.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/25.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个正整数，返回它在 Excel 表中相对应的列名称。

 例如，

     1 -> A
     2 -> B
     3 -> C
     ...
     26 -> Z
     27 -> AA
     28 -> AB
     ...
 
 示例 1:
 输入: 1
 输出: "A"
 
 示例 2:
 输入: 28
 输出: "AB"
 
 示例 3:
 输入: 701
 输出: "ZY"
 */

extension Solution {
    func convertToTitle(_ n: Int) -> String {
        var res = ""
        var n = n
        let a = Int(Character("A").asciiValue!)
        while n > 0 {
            let curr = Character(UnicodeScalar((n - 1) % 26 + a)!)
            res = String(curr) + res
            n = (n - 1) / 26
        }
        return res
    }
}

func test168(s: Solution) {
    let n = 28
    print(s.convertToTitle(n))
}
