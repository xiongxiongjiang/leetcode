//
//  161.相隔为1的编辑距离.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/26.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定两个字符串 s 和 t，判断他们的编辑距离是否为 1。

 注意：
 满足编辑距离等于 1 有三种可能的情形：
 往 s 中插入一个字符得到 t
 从 s 中删除一个字符得到 t
 在 s 中替换一个字符得到 t
 
 示例 1：
 输入: s = "ab", t = "acb"
 输出: true
 解释: 可以将 'c' 插入字符串 s 来得到 t。
 
 示例 2:
 输入: s = "cab", t = "ad"
 输出: false
 解释: 无法通过 1 步操作使 s 变为 t。
 
 示例 3:
 输入: s = "1203", t = "1213"
 输出: true
 解释: 可以将字符串 s 中的 '0' 替换为 '1' 来得到 t。
 */

extension Solution {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        let tc = t.count
        let sc = s.count
        //保证t的长度大于等于s的长度
        if sc > tc {
            return isOneEditDistance(t, s)
        }
        //长度差大于返回false
        if abs(sc - tc) > 1 {
            return false
        }
        let tArr = Array(t)
        let sArr = Array(s)
        for i in 0..<sc {
            if sArr[i] != tArr[i] {
                if sc == tc {
                    return sArr[i+1..<sc] == tArr[i+1..<tc]
                } else {
                    return sArr[i..<sc] == tArr[i+1..<tc]
                }
            }
        }
        //如果按位比较没有差异，则可能是t最后一位有差异
        return sc + 1 == tc
    }
}

func test161(s: Solution) {
    let str1 = "cab"
    let str2 = "ad"
    print(s.isOneEditDistance(str1, str2))
}


extension String {
    // 截取字符串：从index到结束处
    // - Parameter index: 开始索引
    // - Returns: 子字符串
    func substring(_ index: Int) -> String {
        let theIndex = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[theIndex..<endIndex])
    }
}
