//
//  171.Excel表列序号.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/25.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个Excel表格中的列名称，返回其相应的列序号。

 例如，

     A -> 1
     B -> 2
     C -> 3
     ...
     Z -> 26
     AA -> 27
     AB -> 28
     ...
 
 示例 1:
 输入: "A"
 输出: 1
 
 示例 2:
 输入: "AB"
 输出: 28
 
 示例 3:
 输入: "ZY"
 输出: 701
 
 致谢：
 特别感谢 @ts 添加此问题并创建所有测试用例。
 */

extension Solution {
    func titleToNumber(_ s: String) -> Int {
        let sArr = Array<Character>(s)
        var res = 0
        for i in 0..<sArr.count {
            let curr = Int(sArr[i].asciiValue! - Character("A").asciiValue! + 1)
            res = res * 26 + curr
        }
        return res
    }
}


func test171(s: Solution) {
    let str = "ZY"
    print(s.titleToNumber(str))
}
