//
//  Q26ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/2/29.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q26ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        var nums = [0,0,1,1,1,2,2,3,3,4]
        var nums = [1,1]
        print(self.removeDuplicates2(&nums))
        print(nums)
    }
    
    //此方法比第二种方法速度要快
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let count = nums.count
        if count <= 1 {
            return nums.count
        }
        for i in 0 ..< count {
            let index = count - 1 - i
            if nums[index] == nums[index - 1] {
                nums.remove(at: index - 1)
            }
            if index - 1 == 0 {
                break
            }
        }
        return nums.count
    }

    
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        var count = nums.count
        if count <= 1 {
            return nums.count
        }
        for i in 0 ..< count {
            while (i + 1 < count) && (nums[i] == nums[i + 1]) {
                nums.remove(at: i + 1)
                count -= 1
            }
        }
        return nums.count
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
