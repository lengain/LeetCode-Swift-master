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
        print(self.search([4,5,6,7,8,1,2,3], 7))
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
