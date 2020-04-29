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
        let count = s.count
        if count < 2 {
            return s
        }
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: count), count: count)
        for i in 0..<count {
            dp[i][i] = true
        }
        var maxLen = 1
        var start = 0
        let strArr = Array(s)
        for j in 1..<count {
            for i in 0..<j {
                if strArr[i] == strArr[j] {
                    if j - i < 3 {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i + 1][j - 1]
                    }
                } else {
                    dp[i][j] = false
                }
                if dp[i][j] == true {
                    let currLen = j - i + 1
                    if currLen > maxLen {
                        maxLen = currLen
                        start = i
                    }
                }
            }
        }
        let range = s.index(s.startIndex, offsetBy: start)..<s.index(s.startIndex, offsetBy: start + maxLen)
        return String(s[range])
        
//        guard s.count > 0 else {
//            return ""
//        }
//        guard s.count > 1 else {
//            return s
//        }
//        var str_arr: [Character] = ["#"]
//        for ele in Array(s){
//            str_arr.append(ele)
//            str_arr.append("#")
//        }
//        // Array to record longest palindrome
//        var result_arr = [Int](repeating: 0, count: str_arr.count)
//        var center = 0, boundary = 0, maxLen = 0, result_center = 0
//
//        //  首位的 "#" 不用管
//        for i in 1..<str_arr.count-1 {
//            // calc mirror i = center-(i-center)
//            let iMirror = 2 * center - i
//            result_arr[i] = boundary > i ? min(boundary-i, result_arr[iMirror]) : 0
//            // Attempt to expand palindrome centered at i
//            while i-1-result_arr[i] >= 0 , i + 1 + result_arr[i] <= str_arr.count - 1, str_arr[i+1+result_arr[i]] == str_arr[i-1-result_arr[i]]{
//                result_arr[i]+=1
//            }
//            // update center and boundary
//            // 用来记录的
//            if i + result_arr[i] > boundary {
//                center = i
//                boundary = i+result_arr[i]
//            }
//            // update result
//            if result_arr[i] > maxLen{
//                maxLen = result_arr[i]
//                result_center = i
//            }
//        }
//        let ans = String(s[s.s_index(offset: (result_center-maxLen)/2)..<s.s_index(offset: (result_center+maxLen)/2)])
//        return ans
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
