//
//  quick.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let pivot = array[array.count / 2]
    var less = [Int]()
    var more = [Int]()
    for i in 0..<array.count {
        if array[i] < pivot {
            less.append(array[i])
        } else if array[i] > pivot {
            more.append(array[i])
        }
    }
    return quickSort(less) + [pivot] + quickSort(more)
}
