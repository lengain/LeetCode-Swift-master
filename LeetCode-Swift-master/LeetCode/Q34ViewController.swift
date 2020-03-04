//
//  Q34ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/4.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q34ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.searchRange([2,2], 2))
        print(self.searchRange([5,7,7,8,8,10], 8))
        print(self.searchRange([5,7,7,8,8,10], 6))
        print(self.searchRange([], 6))
        print(self.searchRange([2], 6))
        print(self.searchRange([2], 2))
    }
    
    //二分查找
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        var left = 0
        var right = nums.count - 1
        let result = [-1, -1]
        if nums.count == 1 {
            return nums[0] == target ? [0,0] : result
        }
        while left < right {
            let index = (left + right)/2
            if nums[index] > target {
                if right == index {
                    break
                }else {
                    right = index
                }
            }else if nums[index] < target {
                if nums[right] == target {
                    return self.search(nums: nums, index: right, target: target)
                }
                if left == index {
                    break
                }else {
                    left = index
                }
                
            }else {
                return self.search(nums: nums, index: index, target: target)
            }
        }
        return result
    }
    
    func search(nums : [Int], index : Int ,target : Int) -> [Int] {
        var i = index
        var result = [-1, -1]
        if nums.count <= 1 {
            return [0,0]
        }
        while i >= 0 {
            if nums[i] != target {
                result[0] = i + 1
                break
            }else {
                result[0] = i
                i -= 1
            }
        }
        var j = index
        while j < nums.count {
            if nums[j] != target {
                result[1] = j - 1
                break
            }else {
                result[1] = j
                j += 1
            }
        }
        return result
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
