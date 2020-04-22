//
//  114.二叉树展开为链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/22.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，原地将它展开为链表。

 例如，给定二叉树

     1
    / \
   2   5
  / \   \
 3   4   6
 
 将其展开为：
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 */

extension Solution {
    func flatten(_ root: TreeNode?) {
        var nodes = [TreeNode]()
        flattenDfs(root: root, nodes: &nodes)
        for i in 0..<nodes.count {
            print(nodes[i].val)
            if i + 1 < nodes.count {
                nodes[i].left = nil
                nodes[i].right = nodes[i+1]
            }
        }
    }
    
    func flattenDfs(root: TreeNode?, nodes: inout [TreeNode]) {
        guard let root = root else { return }
        nodes.append(root)
        flattenDfs(root: root.left, nodes: &nodes)
        flattenDfs(root: root.right, nodes: &nodes)
    }
}

func test114(s: Solution) {
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    let node6 = TreeNode(6)

    node1.left = node2
    node1.right = node5
    
    node2.left = node3
    node2.right = node4
    
    node5.right = node6
    
    s.flatten(node1)

}
