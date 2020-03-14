//
//  Q55ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/13.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q55ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(self.canJump([3,2,1,0,4]))
        print(self.canJump([2,3,1,1,4]))
    }
    
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count <= 1 {
            return true
        }
        var maxStep = nums[0]
        for i in 1 ..< nums.count {
            if maxStep <= 0 {
                break
            }
            maxStep = max(maxStep - 1, nums[i])
            if maxStep + i >= nums.count - 1 {
                return true
            }
        }
        return false
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
