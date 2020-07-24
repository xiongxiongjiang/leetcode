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
    
    //非递归算法
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        /*
        对于任一结点P，
        1)若其左孩子不为空，则将P入栈并将P的左孩子置为当前的P，然后对当前结点P再进行相同的处理；
        2)若其左孩子为空，则取栈顶元素并进行出栈操作，访问该栈顶结点，然后将当前的P置为栈顶结点的右孩子；
        3)直到P为NULL并且栈为空则遍历结束
         */
        var stack = [TreeNode]()
        var curr = root
        var res = [Int]()
        while stack.isEmpty == false || curr != nil {
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            //用数组实现栈，移除最后一个(removeLast)等于pop()，往数组最后一个添加(append)等于push()
            curr = stack.removeLast()
            res.append(curr!.val)
            curr = curr?.right
        }
        return res
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

    print(s.inorderTraversal1(nodeA))
}
