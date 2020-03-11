//
//  Q45ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/10.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q45ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print(self.jump([2,3,1,1,4]))
        print(self.jump([5,4,1,2]))
        print(self.jump([2,0,2]))
    }
    
    func jump(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        let count = nums.count

        var step = 0
        var maxDistance = 0
        var border = 0
        for i in 0 ..< count {
            maxDistance = max(maxDistance, nums[i] + i)
            if i == border {
                border = maxDistance
                step += 1
                if maxDistance >= count - 1 {
                    break;
                }
            }
        }
        return step
    }
}
