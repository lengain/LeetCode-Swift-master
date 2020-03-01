//
//  Q31ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/1.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q31ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var nums = [1,2,3]
        self.nextPermutation(&nums)
        print(nums)
        
        var nums2 = [3,2,1]
        self.nextPermutation(&nums2)
        print(nums2)
        
        var nums3 = [1,3,2]
        self.nextPermutation(&nums3)
        print(nums3)
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count <= 0 {
            return
        }
        for i in 0 ..< nums.count {
            for j in 0 ..< nums.count - i {
                let index = nums.count  - i - 1
                let jIndex = index - j - 1
                if jIndex >= 0 {
                    if nums[index] > nums[jIndex] {
                        let temp = nums[index]
                        nums[index] = nums[jIndex]
                        nums[jIndex] = temp
                        return
                    }
                }
            }
            
        }
        
        for i in 0 ..< nums.count {
            let index = nums.count - i - 1
            if index <= i {
                return
            }
            let temp = nums[index]
            nums[index] = nums[i]
            nums[i] = temp
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
