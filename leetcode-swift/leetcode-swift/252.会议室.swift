//
//  252.会议室.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/24.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个会议时间安排的数组，每个会议时间都会包括开始和结束的时间 [[s1,e1],[s2,e2],...] (si < ei)，请你判断一个人是否能够参加这里面的全部会议。

 示例 1:
 输入: [[0,30],[5,10],[15,20]]
 输出: false
 
 示例 2:
 输入: [[7,10],[2,4]]
 输出: true
 */

extension Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        guard intervals.count > 1 else {
            return true
        }
        var intervals = intervals
        intervals.sort { (first, second) -> Bool in
            return first.first ?? 0 < second.first ?? 0
        }
        for i in 0..<intervals.count - 1 {
            if intervals[i].last! > intervals[i+1].first! {
                return false
            }
        }
        return true
    }
}

func test252(s: Solution) {
//    let intervals = [[0,30],[5,10],[15,20]]
    let intervals = [[7,10],[2,4]]
    print(s.canAttendMeetings(intervals))
}

