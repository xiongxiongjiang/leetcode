//
//  096.不同的二叉搜索树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/28.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？

 示例:
 输入: 3
 输出: 5
 解释:
 给定 n = 3, 一共有 5 种不同结构的二叉搜索树:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
 */

extension Solution {
    func numTrees(_ n: Int) -> Int {
        //给定一个有序序列 1 ... n，为了根据序列构建一棵二叉搜索树。我们可以遍历每个数字 i，将该数字作为树根，1 ... (i-1) 序列将成为左子树，(i+1) ... n 序列将成为右子树
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                //j-1表示j左边序列的长度,i-j表示序列右边的长度
                //dp[i]和序列的内容无关，只和序列的长度有关
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        return dp[n]
    }
}

func test096(s: Solution) {
    let n = 3
    print(s.numTrees(n))
}

