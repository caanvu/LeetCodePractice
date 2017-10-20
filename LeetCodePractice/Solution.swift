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
    func longestPalindromeFirst(_ s: String) -> String {
        var reverseString = Array(s.reversed())
        var sArray = Array(s.characters)
        let count = sArray.count
        var resultStart = 0
        var resultEnd = 0
        var lenght = 0
        var le:[[Int16]] = Array(repeatElement(Array(repeatElement(0, count: count)), count: count))
        for  i in 0..<count {
            for  j in 0..<count {
                if sArray[i] == reverseString[j] {
                    if i == 0 || j == 0 {
                        le[i][j] = 1
                    } else {
                        le[i][j] = le[i-1][j-1] + 1
                    }
                    if le[i][j] >= lenght {
                        lenght = Int(le[i][j])
                        //判断 是否为回文字符串的逆序
                        if (j - lenght + 1 + i) == count - 1{
                            resultStart = i - lenght + 1
                            resultEnd = i
                        }
                    }
                }else {
                    le[i][j] = 0
                }
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: resultStart)
        let endIndex = s.index(s.startIndex, offsetBy: resultEnd+1)
        return String(s[startIndex..<endIndex])
    }
    func longestPalindrome(_ s: String) -> String {
        let count = s.lengthOfBytes(using: .ascii)
        var fir = 0
        var last = 1
        let arr = Array(s.characters)
        if count <= 1 {
            return s
        }
        var le:[[Bool]] = Array(repeatElement(Array(repeatElement(false, count: count)), count: count))
        for i in 0..<count {
            le[i][i] = true
        }
        for i in 0..<count-1 {
            if arr[i] == arr[i+1] {
                le[i][i+1] = true
                fir = i
                last = i + 2
            }
        }
        for k in 3..<count+1 {
            var j = 0
            for i in 0..<count-k+1 {
                j = k + i - 1
                if arr[i] == arr[j] && le[i+1][j-1] {
                    le[i][j] = true
                    fir = i
                    last = j + 1
                }
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: fir)
        let endIndex = s.index(s.startIndex, offsetBy: last)
        return String(s[startIndex..<endIndex])
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


