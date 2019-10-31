//
//  ThressSumClosestViewController.swift
//  LeetCode-Swift-master
//
//  Created by shunlian on 2019/10/30.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class ThressSumClosestViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(Solution1.threeSumClosest([-1, 2, 1, -4], 1))
        print(Solution1.threeSumClosest([0, 1, 2], 0))
        print(Solution1.threeSumClosest([1, 1, -1], 0))
        print(Solution1.threeSumClosest([1,1,-1,-1,3], -1))
        print(Solution1.threeSumClosest([1,1,1,0], 100))
    }
    
    
    /// 排序+双指针
    /// 因为是三个数的操作,因此可以固定一个数,然后双指针向内移动边计算边查找
    /// 为了实现双指针查找必须先排序,排序的时间复杂度为O(n * log n)
    /// 初始化一个用于保存结果的值  threeSum = sortedNums[0] + sortedNums[1] + sortedNums[2],不需要设初值，从数组中抽取三个元素，假设这是最接近的三数之和，后面再更新
    /// 从小到大开始循环,假设下标为i,设置left=i+1,right=ortedNums.count - 1,这样就形成了一个数为基准,剩下两个数从外向内移动的情况.
    class Solution1 {
        class func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
            
            let sortedNums = nums.sorted(by: < )

            var threeSum = sortedNums[0] + sortedNums[1] + sortedNums[2];
            for (i, item) in sortedNums.enumerated() {
                var left = i + 1
                var right = sortedNums.count - 1
                while left < right {
                    let sum = item + sortedNums[left] + sortedNums[right];
                    if abs(target - threeSum) > abs(target - sum) {
                        threeSum = sum
                    }
                    if sum > target {
                        right -= 1
                    }else if sum < target {
                        left += 1
                    }else {
                        return threeSum;
                    }
                }
            }
            return threeSum;
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
