//
//  060.第k个排列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/15.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给出集合 [1,2,3,…,n]，其所有元素共有 n! 种排列。

 按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：

 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 给定 n 和 k，返回第 k 个排列。

 说明：
 给定 n 的范围是 [1, 9]。
 给定 k 的范围是[1,  n!]。
 
 示例 1:
 输入: n = 3, k = 3
 输出: "213"
 
 示例 2:
 输入: n = 4, k = 9
 输出: "2314"
 */

extension Solution {
    
    //leetcode上超时
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var nums = [Int]()
        for i in 1...n {
            nums.append(i)
        }
        var res = [[Int]]()
        var track = [Int]()
        backTrackGetPermutation(nums: nums, k: k, start: 0, res: &res, track: &track)
        var str = ""
        for num in res[k - 1] {
            str.append(Character("\(num)"))
        }
        return str
    }
    
    private func backTrackGetPermutation(nums: [Int], k: Int, start: Int, res: inout [[Int]], track: inout [Int]) {
        if track.count == nums.count {
            res.append(track)
            return
        }
        for i in 0..<nums.count {
            //不会剪枝，待优化
            print(i, nums.count)
            if track.contains(nums[i]) == true {
                continue
            }
            track.append(nums[i])
            backTrackGetPermutation(nums: nums, k: k, start: start + i, res: &res, track: &track)
            track.removeLast()
        }
    }
    
    
    func getPermutation1(_ n: Int, _ k: Int) -> String {
        var nums: [Int] = []
        for i in 1...n {
            nums.append(i)
        }
        var res: String = ""
        backtracking(&nums, n, k-1, factorial(n - 1), &res)
        return res
    }
    
    /// 递归算法，直接找阶乘规律，每次取余继续
    /// - Parameters:
    ///   - nums: 剩余的数字
    ///   - n: n
    ///   - k: k
    ///   - count: n - 1 的阶乘结果
    ///   - res: 结果
    func backtracking(_ nums: inout [Int], _ n: Int, _ k: Int, _ count: Int, _ res: inout String) {
        if nums.count == 1 {
            res += String(nums[0])
            return
        }
        let index = k / count
        //因为是从1开始的，所以index不用-1
        res += String(nums.remove(at: index))
        backtracking(&nums, n - 1, k % count, count / (n - 1), &res)
    }
    
    //计算阶乘
    func factorial(_ n: Int) -> Int {
        var n = n
        var result = 1
        while n > 1 {
            result *= n
            n -= 1
        }
        return result
    }
}

func test060(s: Solution) {
    let n = 8
    let k = 15485
//    let n = 4
//    let k = 9
    print(s.getPermutation1(n, k))
}
