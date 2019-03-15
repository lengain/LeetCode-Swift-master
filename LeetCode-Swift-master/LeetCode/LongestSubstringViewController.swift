//
//  LongestSubstringViewController.swift
//  LeetCode-Swift-master
//
//  Created by lengain on 2019/3/14.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class LongestSubstringViewController: LNBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Solution.lengthOfLongestSubstring("abcabcbb"))
        print(Solution.lengthOfLongestSubstring("bbbbb"))
        print(Solution.lengthOfLongestSubstring("pwwkew"))
        print(Solution.lengthOfLongestSubstring("cdd"))
        print(Solution.lengthOfLongestSubstring("ohvhjdml"))
    }
    
    class Solution {
        class func lengthOfLongestSubstring(_ s: String) -> Int {
            var substring : String = ""
            var maxSubstringLength = 0
            for character in s {
                if substring.contains(character) {
                    if substring.first == character {
                        substring.append(character)
                        substring.removeFirst()
                    }else {//被截断
                        if maxSubstringLength < substring.count {
                            maxSubstringLength = substring.count
                        }
                        let index = substring.firstIndex(of: character)!
                        let preString = substring[index...]
                        substring = String(preString)
                        substring.removeFirst()
                        substring.append(character)
                    }
                }else {
                    substring.append(character)
                }
            }
            if maxSubstringLength < substring.count {
                maxSubstringLength = substring.count
            }
            return maxSubstringLength
        }
    }
//    Given a string, find the length of the longest substring without repeating characters.
//    Example 1:
//
//    Input: "abcabcbb"
//    Output: 3
//    Explanation: The answer is "abc", with the length of 3.
//    Example 2:
//
//    Input: "bbbbb"
//    Output: 1
//    Explanation: The answer is "b", with the length of 1.
//    Example 3:
//
//    Input: "pwwkew"
//    Output: 3
//    Explanation: The answer is "wke", with the length of 3.
//    Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
}
