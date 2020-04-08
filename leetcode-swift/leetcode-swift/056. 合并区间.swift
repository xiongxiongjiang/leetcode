//
//  056. 合并区间.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给出一个区间的集合，请合并所有重叠的区间。

 示例 1:
 输入: [[1,3],[2,6],[8,10],[15,18]]
 输出: [[1,6],[8,10],[15,18]]
 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 
 示例 2:
 输入: [[1,4],[4,5]]
 输出: [[1,5]]
 解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
 */

/*
 class Solution {
     func merge(_ intervals: [[Int]]) -> [[Int]] {
         guard intervals.count > 1 else { return intervals }
         let sortedIntervals = intervals.sorted { $0.first! < $1.first! }
         
         var newIntervals = [[Int]]()
         var newIntervalsLeftElement = sortedIntervals.first?.first
         var newIntervalsRightElement = sortedIntervals.first?.last
         
         for element in sortedIntervals[1...] {
             if newIntervalsRightElement! >= element.first! {
                 if newIntervalsRightElement! < element.last! {
                     newIntervalsRightElement = element.last
                 }
             } else {
                 newIntervals.append([newIntervalsLeftElement!, newIntervalsRightElement!])
                 newIntervalsLeftElement = element.first
                 newIntervalsRightElement = element.last
             }
         }

         newIntervals.append([newIntervalsLeftElement!, newIntervalsRightElement!])

         return newIntervals
     }
 }
 */

extension Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else {
            return intervals
        }
        let sorted = intervals.sorted { (first, second) -> Bool in
            first.first! < second.first!
        }
        var res = [[Int]]()
        var left = sorted.first?.first
        var right = sorted.first?.last
        for section in sorted[1...] {
            if right! >= section.first! {
                if right! < section.last! {
                    right = section.last
                }
            } else {
                res.append([left!, right!])
                left = section.first
                right = section.last
            }
        }
        res.append([left!, right!])
        return res
    }
}

func test056(s: Solution) {
    let i = [[1,3],[2,6],[8,10],[15,18]]
    print(s.merge(i))
}
