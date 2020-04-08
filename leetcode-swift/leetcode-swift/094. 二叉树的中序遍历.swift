//
//  094. 二叉树的中序遍历.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，返回它的中序 遍历。

 示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,3,2]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */

fileprivate var arr = [Int]()

extension Solution {
    //中序遍历，左中右
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return arr }
        _ = inorderTraversal(root.left)
        arr.append(root.val)
        _ = inorderTraversal(root.right)
        return arr
    }
}

/*
   3
  / \
 9  20
   /  \
  15   7
 */
func test094(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)

    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE

    print(s.inorderTraversal(nodeA))
}
