//
//  179.最大数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/22.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一组非负整数，重新排列它们的顺序使之组成一个最大的整数。

 示例 1:
 输入: [10,2]
 输出: 210
 
 示例 2:
 输入: [3,30,34,5,9]
 输出: 9534330
 
 说明: 输出结果可能非常大，所以你需要返回一个字符串而不是整数。
 */

extension Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var res = ""
        let newNums = nums.sorted { (num1, num2) -> Bool in
            return Int("\(num1)" + "\(num2)") ?? 0 > Int("\(num2)" + "\(num1)") ?? 0
        }
        for num in newNums {
            res += "\(num)"
        }
        if res.first == "0" {
            return "0"
        }
        return res
    }
}


func test179(s: Solution) {
    let nums = [3,30,34,5,9]
    print(s.largestNumber(nums))
}
