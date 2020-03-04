//
//  Q33ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/3.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q33ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.search2([3,1], 1))
        print(self.search2([1,3], 3))
        print(self.search2([1,3], 1))
        print(self.search2([1], 5))
        print(self.search2([], 5))
        print(self.search2([4,5,6,7,0,1,2], 0))
        print(self.search2([4,5,6,7,0,1,2], 3))
        print(self.search2([4,5,6,7,8,1,2,3], 7))
    }
    
    // 参考https://leetcode-cn.com/problems/search-in-rotated-sorted-array/solution/ji-jian-solution-by-lukelee/
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid : Int = (left + right) / 2
            if (nums[0] > target ? 1 : 0) ^ (nums[0] > nums[mid] ? 1 : 0) ^ (target > nums[mid] ? 1 : 0)  > 0 {
                left = mid + 1
            }else {
                right = mid;
            }
        }
        return left == right && nums[left] == target ? left : -1
    }
    
    //要求是事件复杂度是 N(logN)，可以使用二分查找
    func search2(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        var rotateIndex = -1
        for i in 0 ... nums.count - 2 {
            if nums[i] > nums[i + 1] {
                rotateIndex = i + 1
                break
            }
        }
        if rotateIndex == -1 {
            return self.binarySearch(left: 0, right: nums.count - 1, nums: nums, target: target)
        }else {
            if nums[0] <= target {
                return self.binarySearch(left: 0, right: rotateIndex - 1, nums: nums, target: target)
            }else {
                return self.binarySearch(left: rotateIndex, right: nums.count - 1, nums: nums, target: target)
            }
        }

    }
    
    func binarySearch(left:Int,right:Int,nums:[Int],target:(Int)) -> Int {
        var l = left
        var r = right
        while  l < r {
            let index = (l + r) / 2
            if nums[index] > target {
                if r == index {
                    break
                }else {
                    r = index
                }
                
            }else if (nums[index] < target) {
                if l == index {
                    if (nums[r] == target) {
                        return r
                    }
                    break
                }else {
                    l = index
                }
            }else {
                return index
            }
            
        }
        return l == r && nums[l] == target ? r : -1
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
