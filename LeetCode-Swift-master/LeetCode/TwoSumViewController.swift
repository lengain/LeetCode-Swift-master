//
//  TwoSumViewController.swift
//  LeetCode-Swift-master
//
//  Created by lengain on 2019/1/14.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class TwoSumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        print(Solution1.twoSum([2,7,11,5], 9))
        print(Solution1.twoSum([2,7,11,5], 13))
        print(Solution1.twoSum([2,7,11,5], 18))
    }
    
    class Solution1 {
        class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            for i in 0..<nums.count {
                for j in i + 1..<nums.count {
                    if nums[i] + nums[j] == target {
                        return [i,j]
                    }
                }
            }
            return [];
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
