//
//  135. 分发糖果.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 老师想给孩子们分发糖果，有 N 个孩子站成了一条直线，老师会根据每个孩子的表现，预先给他们评分。

 你需要按照以下要求，帮助老师给这些孩子分发糖果：

 每个孩子至少分配到 1 个糖果。
 相邻的孩子中，评分高的孩子必须获得更多的糖果。
 那么这样下来，老师至少需要准备多少颗糖果呢？

 示例 1:
 输入: [1,0,2]
 输出: 5
 解释: 你可以分别给这三个孩子分发 2、1、2 颗糖果。
 
 示例 2:
 输入: [1,2,2]
 输出: 4
 解释: 你可以分别给这三个孩子分发 1、2、1 颗糖果。
      第三个孩子只得到 1 颗糖果，这已满足上述两个条件。
 */

extension Solution {
    func candy(_ ratings: [Int]) -> Int {
        let count = ratings.count
        if count == 0 { return -1 }
        if count == 1 { return 1 }
        var result = Array(repeating: 1, count: count)
        for i in 1..<count {
            if ratings[i] > ratings[i - 1] {
                //如果后面的比前面的高分，则获得+1个糖果
                result[i] = result[i - 1] + 1
            }
        }
        for i in 1..<count {
            let j = count - i
            if ratings[j - 1] > ratings[j] && result[j - 1] <= result[j] {
                result[j - 1] = result[j] + 1
            }
        }
        var sum = 0
        for num in result {
            sum += num
        }
        return sum
    }
}

func test135(s: Solution) {
    //let rantings = [1, 2, 87, 87, 87, 2, 1]
    //let rantings = [1, 0, 2]
    let rantings = [1,3,4,5,2]
    let s = Solution()
    print(s.candy(rantings))
}
