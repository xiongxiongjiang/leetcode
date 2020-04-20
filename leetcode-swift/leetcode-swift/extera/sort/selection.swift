//
//  selection.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    var a = array
    for i in 0..<array.count {
        var lowest = i
        for j in i+1..<array.count {
            if a[j] < a[lowest] {
                lowest = j
            }
        }
        a.swapAt(i, lowest)
    }
    return a
}
