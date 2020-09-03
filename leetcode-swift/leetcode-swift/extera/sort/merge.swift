//
//  merge.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/9/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

//MARK:归并方式一:递归法（Top-down）
func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    //1.在合并过程中，你需要创建2个索引来追踪合并的两个数组。
    var leftIndex = 0
    var rightIndex = 0
    //2.这里的空数组为合并数组，在接下来的步骤里，这个空数组会不断地从其它数组放入新元素。
    var orderedPile = [Int]()
    //3.这里的while循环会将左右两侧的数组进行比较，并按照大小放入到orderedPile里。
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    //4.如果执行到步骤4，则证明leftPile和rightPile里的数字均已完全合并到orderedPile里。这时候，我们不需要继续做比较，只需要将剩下的数组合并起来。
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }

    return orderedPile
}

//MARK:归并排序(Top-down implementation)
func mergeSort(_ array: [Int]) -> [Int] {
    //1.如果传入数组为空或者只有一个元素，我们就不需要继续拆分，直接返回该传入数组。
    guard array.count > 1 else { return array }
    //2.找出数组个数中间值。
    let middleIndex = array.count / 2
    //3.使用步骤2得到的中间值，不断的拆分左边的数组。
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    //4.同时不断拆分右边的数组。
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    //5.最后，将所有数组合并到一起，得到排序数组。
    return merge(leftPile: leftArray, rightPile: rightArray)
}


