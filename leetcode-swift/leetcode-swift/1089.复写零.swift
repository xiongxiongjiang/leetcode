//
//  1089.复写零.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/24.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一个长度固定的整数数组 arr，请你将该数组中出现的每个零都复写一遍，并将其余的元素向右平移。
 注意：请不要在超过该数组长度的位置写入元素。
 要求：请对输入的数组 就地 进行上述修改，不要从函数返回任何东西。

 示例 1：
 输入：[1,0,2,3,0,4,5,0]
 输出：null
 解释：调用函数后，输入的数组将被修改为：[1,0,0,2,3,0,0,4]
 
 示例 2：
 输入：[1,2,3]
 输出：null
 解释：调用函数后，输入的数组将被修改为：[1,2,3]

 提示：
 1 <= arr.length <= 10000
 0 <= arr[i] <= 9
 */

extension Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        let count = arr.count
        var i = 0
        while i < count {
            if arr[i] == 0 {
                arr.insert(0, at: i + 1)
                arr.removeLast()
                i += 1
            }
            i += 1
        }
    }
}

func test1089(s: Solution) {
    var arr = [1,0,2,3,0,4,5,0]
    s.duplicateZeros(&arr)
    print(arr)
}
