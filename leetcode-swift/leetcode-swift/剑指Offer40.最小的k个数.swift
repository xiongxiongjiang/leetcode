//
//  040. 最小的k个数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。

 示例 1：
 输入：arr = [3,2,1], k = 2
 输出：[1,2] 或者 [2,1]
 
 示例 2：
 输入：arr = [0,1,2,1], k = 1
 输出：[0]
  
 限制：
 0 <= k <= arr.length <= 10000
 0 <= arr[i] <= 10000
 
 */

extension Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        guard arr.count <= 10000, k >= 0, k <= arr.count else {
            return []
        }
        let newArr = arr.sorted(by: <)
        return Array(newArr[0..<k])
    }
}

func testOffer040(s: Solution) {
    let arr = [14, 5, 1, 6, 2, 7, 13, 8]
    let k = 3
    print(s.getLeastNumbers(arr, k))
}

