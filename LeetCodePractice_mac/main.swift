//
//  main.swift
//  LeetCodePractice_mac
//
//  Created by wuwei on 2020/10/16.
//  Copyright © 2020 TK. All rights reserved.
//

import Foundation

let s = Solutions()
print("\(Date()) start")
//        print("\(Date()) substring = \(s.longestPalindrome("abcbdddcbcbc"))")
print("\(s.twoSum([2, 7, 11, 15], 9))")
print("\(s.lengthOfLongestSubstring("aaaaaaa"))")
print("\(s.findMedianSortedArrays([3], [-2,-1]))")
print("\(s.longestPalindromeFirst("bb"))")
print("\(s.longestPalindromeFirst("abba"))")
print("\(s.longestPalindromeFirst("abab"))")
print("ZigZag Conversion:\(s.convert("PAYPALISHIRING", 3))")
print("myAtoi: \(s.myAtoi("    -1"))")

