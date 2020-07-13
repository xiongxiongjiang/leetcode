//
//  insertion.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

func insertionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    var a = array
    for i in 1..<a.count {
        for j in stride(from: i, to: 0, by: -1) {
            if a[j] < a[j - 1] {
                a.swapAt(j, j - 1)
            }
            print(a)
        }
    }
    return a
}

