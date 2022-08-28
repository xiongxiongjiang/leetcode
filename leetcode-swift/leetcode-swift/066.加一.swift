//
//  066. 加一.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。

 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

 你可以假设除了整数 0 之外，这个整数不会以零开头。

 示例 1:
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 
 示例 2:
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 */

extension Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var showPlusOne = false
        var newDidits = [Int]()
        for (index, num) in digits.reversed().enumerated() {
            if index == 0 {
                let last = num + 1
                if last == 10 {
                    showPlusOne = true
                    newDidits.append(0)
                } else {
                    newDidits.append(last)
                }
            } else {
                if showPlusOne == true {
                    //继续处理
                    let new = num + 1
                    if new == 10 {
                        showPlusOne = true
                        newDidits.append(0)
                    } else {
                        showPlusOne = false
                        newDidits.append(new)
                    }
                } else {
                    //直接加
                    newDidits.append(num)
                }
            }
        }
        if showPlusOne == true {
            newDidits.append(1)
        }
        return newDidits.reversed()
    }
}

func test066(s: Solution) {
    print(s.plusOne([4, 9, 9]))
}


class Solution66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in (0..<digits.count).reversed() {
            let res = digits[i] + 1
            if res < 10 {
                digits[i] = res
                break
            } else {
                digits[i] = 0
                if i == 0 {
                    digits.insert(0, at: 0)
                }
            }
        }
        return digits
    }
}
