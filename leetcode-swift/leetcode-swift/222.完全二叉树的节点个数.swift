//
//  222.完全二叉树的节点个数.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/15.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给出一个完全二叉树，求出该树的节点个数。
 说明：
 完全二叉树的定义如下：在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。若最底层为第 h 层，则该层包含 1~ 2h 个节点。

 示例:
 输入:
     1
    / \
   2   3
  / \  /
 4  5 6
 输出: 6
 */

extension Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        return dfs(root: root)
    }
    
    private func dfs(root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return 1 + dfs(root: root.left) + dfs(root: root.right)
    }
}

func test222(s: Solution) {
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    let node6 = TreeNode(6)
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    node3.left = node6
    print(s.countNodes(node1))
}
