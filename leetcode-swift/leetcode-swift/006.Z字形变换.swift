//
//  006.Z字形变换.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/17.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：

 L   C   I   R
 E T O E S I I G
 E   D   H   N
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

 请你实现这个将字符串进行指定行数变换的函数：

 string convert(string s, int numRows);
 
 示例 1:
 输入: s = "LEETCODEISHIRING", numRows = 3
 输出: "LCIRETOESIIGEDHN"
 
 示例 2:
 输入: s = "LEETCODEISHIRING", numRows = 4
 输出: "LDREOEIIECIHNTSG"
 解释:
 L     D     R
 E   O E   I I
 E C   I H   N
 T     S     G
 */

extension Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows < 2 {
            return s
        }
        var strArr = [String](repeating: "", count: numRows)
        for (i, char) in s.enumerated() {
            //以示例来来说， leetco就是一个周期， 正好是两个竖直方向长度-2：numRows * 2 - 2
            let row = i % (numRows * 2 - 2)
            //余数小于2，说明在竖直方向上
            if row < numRows {
                strArr[row].append(char)
            } else {
                strArr[numRows * 2 - 2 - row].append(char)
            }
        }
        return strArr.joined()
    }
}


func test006(s: Solution) {
    let str = "LEETCODEISHIRING", numRows = 4
    print(s.convert(str, numRows))
}
