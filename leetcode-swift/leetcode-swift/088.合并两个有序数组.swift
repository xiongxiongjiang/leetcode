//
//  088.合并两个有序数组.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/12.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

 说明:
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。

 示例:
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 输出: [1,2,2,3,5,6]
 */

extension Solution {
    
    //从后往前遍历，时间复杂度O(n+m)，空间复杂度O(1)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var p = m + n - 1
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] < nums2[p2] {
                nums1[p] = nums2[p2]
                p -= 1
                p2 -= 1
            } else {
                nums1[p] = nums1[p1]
                p -= 1
                p1 -= 1
            }
        }
        //如果p2还有元素，全部补到最前面去
        while p2 >= 0 {
            nums1[p] = nums2[p2]
            p -= 1
            p2 -= 1
        }
        print(nums1)
    }
}

func test088(s: Solution) {
    var nums1 = [1,5,6,7,8,0,0,0,0,0]
    let nums2 = [4,5,6]
    s.merge(&nums1, 5, nums2, 3)
}

class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p = n + m - 1
        var m = m - 1
        var n = n - 1
        while m >= 0 && n >= 0 {
            if nums1[m] > nums2[n] {
                nums1[p] = nums1[m]
                m -= 1
            } else {
                nums1[p] = nums2[n]
                n -= 1
            }
            p -= 1
        }
        while n >= 0 {
            nums1[p] = nums2[n]
            n -= 1
            p -= 1
        }
        print(nums1)
    }
    
    // 合并上面代码后：
    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int)  {
        var p = n + m - 1
        var m = m - 1
        var n = n - 1
        while n >= 0 {
            while m >= 0 && nums1[m] > nums2[n] {
                nums1[p] = nums1[m]
                m -= 1
                p -= 1
            }
            nums1[p] = nums2[n]
            n -= 1
            p -= 1
        }
    }
}

func test0880(s: Solution88) {
    var nums1 = [1,5,6,7,8,0,0,0,0,0]
    let nums2 = [4,5,6]
    s.merge(&nums1, 5, nums2, 3)
}

