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
        var nums = [4,2,0,2,3,2,0]
        self.nextPermutation(&nums)
        print(nums)
        
        var nums2 = [3,2,1]
        self.nextPermutation(&nums2)
        print(nums2)
        
        var nums3 = [1,3,2]
        self.nextPermutation(&nums3)
        print(nums3)
    }
    
    ///解题思路 找到合适的数，交换位置，然后排序剩下的数
    ///合适的数要循环查找
    ///比如先比较个位十位，再比较个位百位，十位百位，再比较个位千位，十位千位，百位千位
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count <= 0 {
            return
        }
        let length = nums.count
        var compareLength = 1
        for _ in 0 ..< length {
            for m in length - compareLength - 1 ..< length - 1 {
                let index = length - 1 - (m - (length - compareLength - 1))
                let compare = length - compareLength - 1
                if compare >= 0 && nums[index] > nums[compare] {

                    let temp = nums[index]
                    nums[index] = nums[compare]
                    nums[compare] = temp
                    
                    for m in length - compareLength ..< nums.count {
                        for n in m + 1 ..< nums.count {
                            if nums[m] > nums[n] {
                                let temp2 = nums[m]
                                nums[m] = nums[n]
                                nums[n] = temp2
                            }
                        }
                    }
                    
                    return
                }
            }
            compareLength += 1
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
