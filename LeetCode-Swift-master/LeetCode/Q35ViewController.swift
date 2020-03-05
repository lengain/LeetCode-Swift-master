//
//  Q35ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/5.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q35ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.searchInsert([1,3,5,6], 7))
        print(self.searchInsert([1,3,5,6], 2))
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.last!  < target {
            return nums.count
        }
        var index = 0
        for i in 0 ..< nums.count {
            if nums[i] >= target {
                index = i
                break
            }
        }
        return index
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
