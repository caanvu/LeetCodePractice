//
//  Solution.swift
//  Test1
//
//  Created by TK on 2017/9/11.
//  Copyright © 2017年 TK. All rights reserved.
//

import UIKit

class Solution: NSObject {
    
    func twoSum(_ nums:[Int],_ target: Int ) -> [Int] {
        var dic = [Int:Int]()
        for (index,num) in nums.enumerated() {
            dic[num] = index
            let remain = target - num
            if let remainIndex = dic[remain], remainIndex != index {
                return [remainIndex,index]
            }
        }
        return []
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let headListNode = ListNode(0)
        var node = headListNode
        var increase = 0
        var left = l1
        var right = l2
        while left != nil || right != nil || increase != 0 {
            let value1 = left?.val
            let value2 = right?.val
            let num = (value1 ?? 0) + (value2 ?? 0) + increase
            let value = num % 10
            increase = num / 10
            let newNode = ListNode(value)
            newNode.val = value
            node.next = newNode
            node = node.next!
            left = left?.next
            right = right?.next
        }
        return headListNode.next
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character:Int]()
        var start = 0
        var end = 0
        var lenght = 0
        for ch in s.characters {
            if let num = dic[ch], num >= start {
                start = num + 1
            }
            lenght = max(lenght, end - start + 1)
            dic[ch] = end
            end += 1
        }
        return lenght
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return self.findMedianSortedArrays(nums2,nums1)
        }
        let m = nums1.count
        let n = nums2.count
        var iMin = 0, iMax = m, i = 0, j = 0, halfLen = (m + n + 1) / 2
        while iMin <= iMax {
            i = ( iMin + iMax ) / 2
            j = halfLen - i
            if i < iMax && nums1[i] < nums2[j - 1] {
                iMin = i + 1
            }else if i > iMin && nums2[j] < nums1[i - 1] {
                iMax = i - 1
            }else {
                var maxLeft = 0
                if i == 0 {
                    maxLeft = nums2[j - 1]
                }else if j == 0 {
                    maxLeft = nums1[i - 1]
                }else {
                    maxLeft = max(nums1[i-1], nums2[j-1])
                }
                if ((m + n) % 2 == 1) {return Double(maxLeft)}
                
                var minRight = 0
                if (i == m) {
                    minRight = nums2[j]
                } else if (j == n) {
                    minRight = nums1[i]
                } else {
                    minRight = min(nums1[i], nums2[j])
                }
                return Double(maxLeft + minRight) / 2.0
            }
        }
        return 0.0
    }
//    func longestPalindromeFirst(_ s: String) -> String {
//        var reverseString = Array(s.reversed())
//        var sArray = Array(s.characters)
//        var i = 0 , j = 0
//        for (i,ch1) in sArray.enumerated() {
//            for (j,ch2) in reverseString.enumerated() {
//                if ch1 == ch2 {
//
//                }
//            }
//        }
//    }
    func longestPalindrome(_ s: String) -> String {
        let count = s.lengthOfBytes(using: .ascii)
        if count <= 1 {
            return s
        }
        var le:[[Bool]] = Array(repeatElement(Array(repeatElement(false, count: count)), count: count))
        for i in 0...count-1 {
            le[i][i] = true
        }
        
        var fir = 0
        var last = 0
        let arr = Array(s.characters)
        for k in 2...count {
            var j = 0
            for i in 0...count-k {
                 j = k + i
                if arr[i] == arr[j] && le[i+1][j-1] {
                    le[i][j] = true
                    fir = i
                    last = j
                }
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: fir)
        let endIndex = s.index(s.startIndex, offsetBy: last + 1)
        return s.substring(with: startIndex..<endIndex)
    }
    
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


