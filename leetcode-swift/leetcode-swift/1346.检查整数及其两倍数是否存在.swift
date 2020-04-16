//
//  1346.检查整数及其两倍数是否存在.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/16.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一个整数数组 arr，请你检查是否存在两个整数 N 和 M，满足 N 是 M 的两倍（即，N = 2 * M）。

 更正式地，检查是否存在两个下标 i 和 j 满足：

 i != j
 0 <= i, j < arr.length
 arr[i] == 2 * arr[j]
  

 示例 1：
 输入：arr = [10,2,5,3]
 输出：true
 解释：N = 10 是 M = 5 的两倍，即 10 = 2 * 5 。
 
 示例 2：
 输入：arr = [7,1,14,11]
 输出：true
 解释：N = 14 是 M = 7 的两倍，即 14 = 2 * 7 。
 
 示例 3：
 输入：arr = [3,1,7,11]
 输出：false
 解释：在该情况下不存在 N 和 M 满足 N = 2 * M 。
 */

extension Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        if arr.count <= 1 {
            return false
        }
        var map = [Int: Int]()
        for num in arr {
            //有两个0，直接返回true
            if num == 0 && map[num] != nil {
                return true
            }
            map[num] = num
        }
        for num in arr {
            //这里就不能判断0的情况了，因为map中key==value
            if num == 0 {
                continue
            }
            if num * 2 == map[2 * num] {
                return true
            }
        }
        return false
    }
}

func test1346(s: Solution) {
    print(s.checkIfExist([-2,0,10,-19,4,6,-8]))
}
