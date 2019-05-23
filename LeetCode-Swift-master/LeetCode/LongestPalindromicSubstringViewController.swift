//
//  LongestPalindromicSubstringViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2019/5/22.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class LongestPalindromicSubstringViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.dddddddd
        print(Solution2.longestPalindrome("aaabb"))//ssabaa//dccdccd
    }
    
    class Solution2 {
        class func longestPalindrome(_ s: String) -> String {
            if s.count <= 1 {
                return s;
            }
            var stringArray = Array(s)
            
            var historyStratIndex = 0
            var maxLength = 1
            for i in 0..<stringArray.count {
                Solution2.checkPalindrome(left: i, right: i, stringArray: &stringArray, historyStratIndex: &historyStratIndex, maxLength: &maxLength)
                Solution2.checkPalindrome(left: i, right: i+1, stringArray: &stringArray, historyStratIndex: &historyStratIndex, maxLength: &maxLength)
            }
            return String(stringArray[historyStratIndex..<(historyStratIndex + maxLength)])
        }
        
        class func checkPalindrome(left:Int,right:Int, stringArray:inout [String.Element],historyStratIndex:inout Int,maxLength:inout Int) -> Void {
            
            var i = left
            var j = right
            while i >= 0 && j < stringArray.count && stringArray[i] == stringArray[j] {
                i -= 1
                j += 1
            }
            if maxLength < j - i - 1 {
                maxLength = j - i - 1;
                historyStratIndex = i + 1;
            }
        }
    
    }
    
    //Time Limit Exceeded
    class Solution1 {
        class func longestPalindrome(_ s: String) -> String {
            var longestPalindrome = s.prefix(1)
            var length : Int
            for i in 0..<s.count {
                length = 1
                var startIndex : String.Index?
                var endIndex : String.Index?
                let currentIndex = s.index(s.startIndex, offsetBy: i)
                var currentLength = 1
                if i - length >= 0 && i + length < s.count {//奇数回文
                    startIndex = s.index(s.startIndex, offsetBy: i - length)
                    endIndex = s.index(s.startIndex, offsetBy: i + length)
                    while s[startIndex!] == s[endIndex!] {
                        currentLength = length * 2 + 1;
                        if i - (length + 1) < 0 || i + (length + 1) >= s.count {
                            break;
                        }
                        length = length + 1
                        startIndex = s.index(s.startIndex, offsetBy: i - length)
                        endIndex = s.index(s.startIndex, offsetBy: i + length)
                    }
                    if (currentLength != length * 2 + 1 && length > 1) {
                        length = length - 1;
                        startIndex = s.index(s.startIndex, offsetBy: i - length)
                        endIndex = s.index(s.startIndex, offsetBy: i + length)
                    }
                }
                if longestPalindrome.count < currentLength && startIndex != nil && endIndex != nil {
                    longestPalindrome = s[startIndex!...endIndex!]
                }
                if i >= 0 && i + length < s.count {//偶数回文
                    length = 1
                    endIndex = s.index(s.startIndex, offsetBy: i + length)
                    if s[currentIndex] == s[endIndex!] {
                        startIndex = currentIndex;
                        while s[startIndex!] == s[endIndex!] {
                            currentLength = length * 2;
                            if i - length < 0 || i + (length + 1) >= s.count {
                                break;
                            }
                            length = length + 1
                            startIndex = s.index(s.startIndex, offsetBy: i - length + 1)
                            endIndex = s.index(s.startIndex, offsetBy: i + length)
                        }
                        if (currentLength != length * 2 && length > 1) {
                            length = length - 1;
                            startIndex = s.index(s.startIndex, offsetBy: i - length + 1)
                            endIndex = s.index(s.startIndex, offsetBy: i + length)
                        }
                    }
                }
                
                if longestPalindrome.count < currentLength && startIndex != nil && endIndex != nil {
                    longestPalindrome = s[startIndex!...endIndex!]
                }
            }
            return String(longestPalindrome)
        }
    }
    /*
     Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
     
     Example 1:
     
     Input: "babad"
     Output: "bab"
     Note: "aba" is also a valid answer.
     Example 2:
     
     Input: "cbbd"
     Output: "bb"
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
