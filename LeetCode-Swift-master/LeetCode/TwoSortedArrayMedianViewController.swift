//
//  TwoSortedArrayMedianViewController.swift
//  LeetCode-Swift-master
//
//  Created by lengain on 2019/3/15.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class TwoSortedArrayMedianViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nums1 = [1,3]
        let nums2 = [2]
        
        print(Solution.findMedianSortedArrays(nums1, nums2))
        //2
        let nums3 = [1, 2]
        let nums4 = [3, 4]
        print(Solution.findMedianSortedArrays(nums3, nums4))
        //2.5
        let nums5 = [1,2]
        let nums6 = [-1,3]
        print(Solution.findMedianSortedArrays(nums5, nums6))
        //1.5

    }
    
    class Solution {
        class func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
            var sortedArray : Array = nums1
            var flag = 0;
            var added = false;
            for number1 in nums2 {
                for index in flag ..< sortedArray.count {
                    if sortedArray[index] > number1 {
                        sortedArray.insert(number1, at: index)
                        flag = index + 1;
                        added = true
                        break;
                    }else {
                        flag += 1;
                    }
                }
                if added {
                    added = false;
                }else {
                    
                    sortedArray.append(number1)
                }
            }
            if sortedArray.count % 2 == 1 {
                return Double(sortedArray[Int(sortedArray.count/2)]);
            }else {
                return Double((sortedArray[sortedArray.count / 2] +  sortedArray[sortedArray.count / 2 - 1]))/2.0;
            }
        }
    }
    
/*
    There are two sorted arrays nums1 and nums2 of size m and n respectively.
    
    Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
    
    You may assume nums1 and nums2 cannot be both empty.
    
    Example 1:
    
    nums1 = [1, 3]
    nums2 = [2]
    
    The median is 2.0
    Example 2:
    
    nums1 = [1, 2]
    nums2 = [3, 4]
    
    The median is (2 + 3)/2 = 2.5
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
