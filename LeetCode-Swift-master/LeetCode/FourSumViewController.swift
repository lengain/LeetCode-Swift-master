//
//  FourSumViewController.swift
//  LeetCode-Swift-master
//
//  Created by shunlian on 2019/10/31.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class FourSumViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(Solution1.fourSum([1, 0, -1, 0, -2, 2], 0))
    }
    
    class Solution1 {
        class func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
            let result : [[Int]] = []
            let sortedNums : [Int] = nums.sorted(by: < )
            for (i, item) in sortedNums.enumerated() {
                
                
                
            }
            
            return result
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
