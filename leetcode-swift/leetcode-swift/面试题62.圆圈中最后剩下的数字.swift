//
//  面试题62.圆圈中最后剩下的数字.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。
 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。
 
 示例 1：
 输入: n = 5, m = 3
 输出: 3
 
 示例 2：
 输入: n = 10, m = 17
 输出: 2
  
 限制：
 1 <= n <= 10^5
 1 <= m <= 10^6
 
 题解：https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/solution/javajie-jue-yue-se-fu-huan-wen-ti-gao-su-ni-wei-sh/
 */

extension Solution {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var res = 0
        for i in 2...n {
            //反推法：所以最终剩下的数字的下标就是3。因为数组是从0开始的，所以最终的答案就是3。
            //总结一下反推的过程，就是 (当前index + m) % 上一轮剩余数字的个数。
            // 最后一轮剩下2个人，所以从2开始反推
            res = (m + res) % i
        }
        //res其实下标，因为数组是从0开始的，所以正好是答案
        return res
    }
}


func testOffer62(s: Solution) {
    let n = 7, m = 9
    print(s.lastRemaining(n, m))
}
