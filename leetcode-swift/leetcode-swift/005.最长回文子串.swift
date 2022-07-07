//
//  005. 最长回文子串.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 
 示例 2：
 输入: "cbbd"
 输出: "bb"
 */

extension Solution {
    func longestPalindrome(_ s: String) -> String {
        let arr = Array<Character>(s)
        let count = arr.count
        var maxCount = 1
        var start = 0
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: count), count: count)
        for i in 0..<count {
            dp[i][i] = true
        }
        for i in 1..<count {
            for j in 0..<i {
                if arr[i] != arr[j] {
                    dp[i][j] = false
                } else {
                    if i-j < 3 {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i-1][j+1]
                    }
                    if dp[i][j] == true && i-j+1 > maxCount {
                        maxCount = i-j+1
                        start = j
                    }
                }
            }
        }
        let res = arr[start...start+maxCount-1].map { c in
            return String(c)
        }.joined()
        return res
    }
}

extension String {

    func s_index(offset: Int) -> String.Index {
        return self.index(self.startIndex, offsetBy: offset)
    }
    
}

func test005(s: Solution) {
//    let str = "adfdsgsdgghereewr"
    let str = "ibvjkmpyzsifuxcabqqpahjdeuzaybqsrsmbfplxycsafogotliyvhxjtkrbzqxlyfwujzhkdafhebvsdhkkdbhlhmaoxmbkqiwiusngkbdhlvxdyvnjrzvxmukvdfobzlmvnbnilnsyrgoygfdzjlymhprcpxsnxpcafctikxxybcusgjwmfklkffehbvlhvxfiddznwumxosomfbgxoruoqrhezgsgidgcfzbtdftjxeahriirqgxbhicoxavquhbkaomrroghdnfkknyigsluqebaqrtcwgmlnvmxoagisdmsokeznjsnwpxygjjptvyjjkbmkxvlivinmpnpxgmmorkasebngirckqcawgevljplkkgextudqaodwqmfljljhrujoerycoojwwgtklypicgkyaboqjfivbeqdlonxeidgxsyzugkntoevwfuxovazcyayvwbcqswzhytlmtmrtwpikgacnpkbwgfmpavzyjoxughwhvlsxsgttbcyrlkaarngeoaldsdtjncivhcfsaohmdhgbwkuemcembmlwbwquxfaiukoqvzmgoeppieztdacvwngbkcxknbytvztodbfnjhbtwpjlzuajnlzfmmujhcggpdcwdquutdiubgcvnxvgspmfumeqrofewynizvynavjzkbpkuxxvkjujectdyfwygnfsukvzflcuxxzvxzravzznpxttduajhbsyiywpqunnarabcroljwcbdydagachbobkcvudkoddldaucwruobfylfhyvjuynjrosxczgjwudpxaqwnboxgxybnngxxhibesiaxkicinikzzmonftqkcudlzfzutplbycejmkpxcygsafzkgudy"
    print(s.longestPalindrome(str))
}
