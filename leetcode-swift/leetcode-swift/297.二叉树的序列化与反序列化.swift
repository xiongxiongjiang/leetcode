//
//  297.二叉树的序列化与反序列化.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/4.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

  class Codec {
     //serialize function coding by xuanwenchao at 2020.06.16
     func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return ""
        }
        var res = [String]() //用来保存结果的数组
        var seq = [TreeNode]() //用来保存节点的队列
        var t = root
        seq.append(t!)
        let s = String(t!.val)
        res.append(s)
        var seq_idx = 0
        while (seq_idx < seq.count){
            t = seq[seq_idx]
            seq_idx += 1
            if t!.left != nil {
                seq.append(t!.left!)
                res.append(String(t!.left!.val))
            } else {
                res.append("null")
            }
            if t!.right != nil {
                seq.append(t!.right!)
                res.append(String(t!.right!.val))
            } else {
                res.append("null")
            }
        }
        return res.joined(separator: ",")
     }
    
    //deserialize function coding by xuanwenchao at 2020.06.16
     func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        let arr = data.split(separator: ",")
        var seq = [TreeNode]()
        let rootNode = TreeNode(0)

        //这两个索引也可以使用swift数组自有的 .first 和 .removeFirst() 来实现，
        //这样可能省两个变量的空间，并且代码更简洁，但是效率上会差的比较多。--友好说明 by xuanwenchao
        var arr_idx = 0
        var seq_idx = 0
        
        if arr.count > 0 && String(arr.first!) != "null" {
            let ele = Int(String(arr[arr_idx]))
            rootNode.val = ele!
            seq.append(rootNode)
            arr_idx += 1
            
            while (seq.count > seq_idx && arr.count > arr_idx) {
                let node = seq[seq_idx]
                seq_idx += 1
                let val  = String(arr[arr_idx]) //left
                if val == "null" {
                    node.left = nil
                } else {
                    let leftNode = TreeNode(Int(val)!)
                    leftNode.left = nil
                    leftNode.right = nil
                    node.left = leftNode
                    seq.append(leftNode)
                }
                arr_idx += 1
                if arr.count > arr_idx {
                    let val  = String(arr[arr_idx]) //right
                    if val == "null" {
                        node.right = nil
                    } else {
                        let rightNode = TreeNode(Int(val)!)
                        rightNode.left = nil
                        rightNode.right = nil
                        node.right = rightNode
                        seq.append(rightNode)
                    }
                } else {
                    node.right = nil
                }
                arr_idx += 1
            }
        } else {
            return nil
        }
        return rootNode
     }
    
 }
