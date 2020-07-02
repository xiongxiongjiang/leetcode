//
//  剑指Offer59-I.滑动窗口的最大值.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/30.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  
 提示：
 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。
 注意：本题与主站 239 题相同：https://leetcode-cn.com/problems/sliding-window-maximum/
 */

extension Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if k <= 0 || k > nums.count || nums.isEmpty {
            return []
        }
        var result = [Int]()
        //创建一个数组，用作单调的双端队列，将队列中的队头数据返回
        //单调递减队列
        var queue = [Int]()
        for i in 0..<nums.count {
            while !queue.isEmpty && nums[queue.last!] <= nums[i] {
                //当前元素nums[i]大于等于队列最后一个数对应的nums的时候，移除队列最后一个
                queue.removeLast()
            }
            //队列中存入的是元素的索引
            //对头到队尾为递减入队，队头为最大
            queue.append(i)
            //队头元素索引超过窗口的起始点，则删除队头元素（说明窗口已经滑了过去）
            if i - k == queue.first! {
                queue.removeFirst()
            }
            //超过k大小的窗口时，每次将队列头部的数据加到result中（队列头部就是最大值）
            if  i >= k - 1 {
                result.append(nums[queue.first!])
            }
            print(queue)
        }
        return result
    }
}

func testOffer59I(s: Solution) {
    let nums = [1,3,-1,-3,5,3,6,7]
    let k = 3
    print(s.maxSlidingWindow(nums, k))
}
