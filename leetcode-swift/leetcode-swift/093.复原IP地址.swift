//
//  093.复原IP地址.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/14.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。

 示例:
 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]
 */

extension Solution {
    
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 || s.count > 12 {
            return []
        }
        var characters = [Character]()
        for char in s {
            characters.append(char)
        }
        var res = [String]()
        var track = [String]()
        backtrackRestoreIpAddresses(characters, 0, &track, &res)
        return res
    }
    
    private func backtrackRestoreIpAddresses(_ characters: [Character], _ start: Int, _ track: inout [String], _ res: inout [String]) {
        if track.count == 4 {
            res.append(track.joined(separator: "."))
            return
        }
        //剩余的char字符串
        let charsLeft = characters.count - start
        //字符串数组剩余容量
        let groupsLeft = 4 - track.count
        
        var minLen = 0, maxLen = 0
        if groupsLeft == 1 {
            minLen = charsLeft
        } else {
            minLen = 1
        }
        if characters[start] == "0" {
            ////防止出现 001，010 等情况
            maxLen = 1
        } else {
            maxLen = charsLeft - groupsLeft + 1
        }
        if minLen > maxLen {
            return
        }
        
        for i in minLen...maxLen {
            let num = String(characters[start..<(start + i)])
            if Int(num)! > 255 {
                continue
            }
            track.append(num)
            backtrackRestoreIpAddresses(characters, start + i, &track, &res)
            track.removeLast()
        }
    }

}

func test093(s: Solution) {
    let str = "2552551113"
    print(s.restoreIpAddresses(str))
}
