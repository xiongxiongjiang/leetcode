//
//  面试题05.替换空格.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

 示例 1：
 输入：s = "We are happy."
 输出："We%20are%20happy."
  
 限制：
 0 <= s 的长度 <= 10000
 */

extension Solution {
    func replaceSpace(_ s: String) -> String {
        var res = ""
        for sub in s {
            if sub == " " {
                res.append("%20")
            } else {
                res.append(sub)
            }
        }
        return res
    }
}

