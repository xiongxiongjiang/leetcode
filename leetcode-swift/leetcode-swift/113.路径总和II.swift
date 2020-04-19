//
//  113.路径总和II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/19.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。
 说明: 叶子节点是指没有子节点的节点。

 示例:
 给定如下二叉树，以及目标和 sum = 22，

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \    / \
         7    2  5   1
 返回:
 [
    [5,4,11,2],
    [5,8,4,5]
 ]
 */

extension Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var res = [[Int]]()
        var track = [Int]()
        pathSumHelper(root: root, sum: sum, track: &track, res: &res)
        return res
    }
    
    func pathSumHelper(root: TreeNode?, sum: Int, track: inout [Int], res: inout [[Int]]) {
        guard let root = root else { return }
        //叶子节点
        if root.val == sum && root.left == nil && root.right == nil  {
            track.append(root.val)
            res.append(track)
            track.removeLast()
            return
        }
        let target = sum - root.val
        track.append(root.val)
        pathSumHelper(root: root.left, sum: target, track: &track, res: &res)
        pathSumHelper(root: root.right, sum: target, track: &track, res: &res)
        track.removeLast()
    }
}

func test113(s: Solution) {
    let root = TreeNode(5)
    let node1 = TreeNode(4)
    let node2 = TreeNode(8)
    let node3 = TreeNode(11)
    let node4 = TreeNode(13)
    let node5 = TreeNode(4)
    let node6 = TreeNode(7)
    let node7 = TreeNode(2)
    let node8 = TreeNode(5)
    let node9 = TreeNode(1)
    
    root.left = node1
    root.right = node2
    
    node1.left = node3
    node2.left = node4
    node2.right = node5
    
    node3.left = node6
    node3.right = node7
    
    node5.left = node8
    node5.right = node9
    
    print(s.pathSum(root, 22))
}
