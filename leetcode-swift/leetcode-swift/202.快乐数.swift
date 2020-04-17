//
//  202.快乐数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/17.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 编写一个算法来判断一个数 n 是不是快乐数。

 「快乐数」定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。如果 可以变为  1，那么这个数就是快乐数。

 如果 n 是快乐数就返回 True ；不是，则返回 False 。

 示例：
 输入：19
 输出：true
 解释：
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 */

extension Solution {

    /*
     3种可能
     1.最终会得到 1。
     2.最终会进入循环。
     3.值会越来越大，最后接近无穷大。
     对于 3 位数的数字，它不可能大于 243。这意味着它要么被困在 243 以下的循环内，要么跌到 1。4 位或 4 位以上的数字在每一步都会丢失一位，直到降到 3 位为止。所以我们知道，最坏的情况下，算法可能会在 243 以下的所有数字上循环，然后回到它已经到过的一个循环或者回到 1。但它不会无限期地进行下去，所以我们排除第三种选择。
     */
    func isHappy(_ n: Int) -> Bool {
        var happySet = Set<Int>()
        var num = n
        while num != 1 && happySet.contains(num) == false {
            happySet.update(with: num)
            num = getNext(n: num)
        }
        return num == 1
    }
    
    private func getNext(n: Int) -> Int {
        var num = n
        var total = 0
        while num > 0 {
            let a = num % 10
            total += a * a
            num = num / 10
        }
        return total
    }
    
}

func test202(s: Solution) {
    print(s.isHappy(999))
}
