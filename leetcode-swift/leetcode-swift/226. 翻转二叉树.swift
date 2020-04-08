//
//  226. 翻转二叉树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 备注:
 这个问题是受到 Max Howell 的 原问题 启发的 ：

 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。
 */

extension Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return nil
        }
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        _ = invertTree(root?.left)
        _ = invertTree(root?.right)
        return root
    }
}

func test226(s: Solution) {
    let root = TreeNode(4)
    let node1 = TreeNode(7)
    let node2 = TreeNode(2)
    let node3 = TreeNode(9)
    let node4 = TreeNode(6)
    let node5 = TreeNode(3)
    let node6 = TreeNode(1)
    root.left = node1
    root.right = node2
    node1.left = node3
    node1.right = node4
    node2.left = node5
    node2.right = node6
    let new = s.invertTree(root)
    print(s.levelOrder(new))
}
