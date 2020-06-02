//
//  543.二叉树的直径.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/16.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一棵二叉树，你需要计算它的直径长度。一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点。
 
 示例 :
 给定二叉树

           1
          / \
         2   3
        / \
       4   5
 返回 3, 它的长度是路径 [4,2,1,3] 或者 [5,2,1,3]。
 
 注意：两结点之间的路径长度是以它们之间边的数目表示。
 */

extension Solution {
    
    //一条路径的长度为该路径经过的节点数减一，所以求直径（即求路径长度的最大值）等效于求路径经过节点数的最大值减一。
    //而任意一条路径均可以被看作由某个节点为起点，从其左儿子和右儿子向下遍历的路径拼接得到。
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        //当前传进来经过root的直径
        let current = maxDepth(root.left) + maxDepth(root.right)
        //递归计算出左右儿子的直径
        let sub = max(diameterOfBinaryTree(root.left), diameterOfBinaryTree(root.right))
        return max(current, sub)
    }
    
}

func test543(s: Solution) {
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node4.right = node5
    print(s.diameterOfBinaryTree(node1))
}
