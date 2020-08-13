//
//  298.二叉树最长连续序列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/4.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一棵指定的二叉树，请你计算它最长连续序列路径的长度。

 该路径，可以是从某个初始结点到树中任意结点，通过「父 - 子」关系连接而产生的任意路径。

 这个最长连续的路径，必须从父结点到子结点，反过来是不可以的。

 示例 1：

 输入:

    1
     \
      3
     / \
    2   4
         \
          5

 输出: 3
 解析: 当中，最长连续序列是 3-4-5，所以返回结果为 3

 示例 2：

 输入:

    2
     \
      3
     /
    2
   /
  1

 输出: 2
 解析: 当中，最长连续序列是 2-3。注意，不是 3-2-1，所以返回 2。
 */

extension Solution {
    func longestConsecutive(_ root: TreeNode?) -> Int {
        return dfs298(nil, root, 0)
    }
    
    func dfs298(_ parent: TreeNode?, _ node: TreeNode?, _ len: Int) -> Int {
        guard node != nil else {
            return len
        }
        var len = len
        if parent != nil && node!.val == parent!.val + 1  {
            len += 1
        } else {
            len = 1
        }
        return max(len, dfs298(node, node?.left, len), dfs298(node, node?.right, len))
    }
}

func test298(s: Solution) {
    let codec = Codec()
    let root = codec.deserialize("1,2,2")
    print(s.longestConsecutive(root))
}
