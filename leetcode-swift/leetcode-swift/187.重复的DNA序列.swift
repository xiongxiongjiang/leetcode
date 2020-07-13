//
//  187.重复的DNA序列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/8.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 所有 DNA 都由一系列缩写为 A，C，G 和 T 的核苷酸组成，例如：“ACGAATTCCG”。在研究 DNA 时，识别 DNA 中的重复序列有时会对研究非常有帮助。

 编写一个函数来查找目标子串，目标子串的长度为 10，且在 DNA 字符串 s 中出现次数超过一次。

 示例：
 
 输入：s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 输出：["AAAAACCCCC", "CCCCCAAAAA"]
 */

extension Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let len = 10
        if s.count < len {
            return []
        }
        var res = Set<String>()
        var set = Set<String>()
        for i in 0...s.count-len {
            let range = s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i + len)
            let curr = String(s[range])
            if set.contains(curr) {
                res.insert(curr)
            } else {
                set.insert(curr)
            }
        }
        return Array(res)
    }
}

func test187(s: Solution) {
//    let str = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
//    let str = "AAAAAAAAAAA"
    let str = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
    print(s.findRepeatedDnaSequences(str))
}
