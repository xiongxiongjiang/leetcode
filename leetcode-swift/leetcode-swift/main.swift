//
//  main.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/8.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

class Solution {
    func isBalanced111(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return abs(maxDepth111(root.left) - maxDepth111(root.right)) < 1
    }
    
    func maxDepth111(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth111(root.left), maxDepth111(root.right)) + 1
    }
}

let s = Solution()
test043(s: s)

//let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
//print(insertionSort(list))
//print(selectionSort(list))
//print(bubbleSort(list))


//10, 15, 29, 23, 4, 38, 5, 17, 14, 26
