//
//  057.插入区间.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/11.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给出一个无重叠的 ，按照区间起始端点排序的区间列表。
 在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。

 示例 1:
 输入: intervals = [[1,3],[6,9]], newInterval = [2,5]
 输出: [[1,5],[6,9]]
 
 示例 2:
 输入: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 输出: [[1,2],[3,10],[12,16]]
 解释: 这是因为新的区间 [4,8] 与 [3,5],[6,7],[8,10] 重叠。
 */

extension Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else {
            return [newInterval]
        }
        var mergeIntervals = intervals
        mergeIntervals.append(newInterval)
        let sorted = mergeIntervals.sorted { (first, second) -> Bool in
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

func test057(s: Solution) {
//    let intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
    let intervals = [[1,5]]
    let newIntervals = [2,3]
    print(s.insert(intervals, newIntervals))
}
