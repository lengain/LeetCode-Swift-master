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

        // Do any additional setup after loading the view.
        print(Solution1.longestPalindrome("ssabaadccdccd"))
    }
    
    class Solution1 {
        class func longestPalindrome(_ s: String) -> String {
            var longestPalindrome = s.prefix(1)
            var length : Int
            for i in 0..<s.count {
                length = 1
                if i - length < 0 || i + length >= s.count {
                    continue
                }
                var startIndex = s.index(s.startIndex, offsetBy: i - length)
                let currentIndex = s.index(s.startIndex, offsetBy: i);
                var endIndex = s.index(s.startIndex, offsetBy: i + length)
                while s[startIndex] == s[endIndex] {//奇数回文
                    if i - (length + 1) < 0 || i + (length + 1) >= s.count {
                        break;
                    }
                    length = length + 1
                    startIndex = s.index(s.startIndex, offsetBy: i - length)
                    endIndex = s.index(s.startIndex, offsetBy: i + length)
                }
                var currentLength = 1
                if length > 1 {
                    currentLength = length * 2 + 1
                }
                if length == 1 {//偶数回文
                    while s[currentIndex] == s[endIndex] {
                        if i - length < 0 || i + (length + 1) >= s.count {
                            break;
                        }
                        length = length + 1
                        startIndex = s.index(s.startIndex, offsetBy: i - length + 1)
                        endIndex = s.index(s.startIndex, offsetBy: i + length)
                    }
                    if length > 1 {
                        currentLength = length * 2
                    }
                }
                
                if longestPalindrome.count < currentLength {
                    longestPalindrome = s[startIndex...endIndex]
                    print("出现回文")
                    print(longestPalindrome);
                }
            }
            return String(longestPalindrome)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
