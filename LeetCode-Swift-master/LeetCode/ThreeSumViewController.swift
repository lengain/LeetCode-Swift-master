//
//  ThreeSumViewController.swift
//  LeetCode-Swift-master
//
//  Created by shunlian on 2019/10/30.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class ThreeSumViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(Solution1.threeSum([-1, 0, 1, 2, -1, -4]))
        print(Solution1.threeSum([0, 0, 0]))
        print(Solution1.threeSum([-2,0,0,2,2]))
    }
    /// 排序+双指针
    /// 首先进行排序,以便进行双指针操作,排序的时间复杂度为O(n*logn)
    /// 双指针排序的时间复杂度为O(n^2)
    class Solution1 {
        class func threeSum(_ nums: [Int]) -> [[Int]] {
            var thressSumArray : [[Int]] = []
            if nums.count < 3 {
                return thressSumArray
            }
            //排序操作,时间复杂度为O(n*logn)
            let sortedNums = nums.sorted(by: < )
            //双指针
            //固定一个数i,然后使left=i + 1,right=sortedNums.count - 1,从中找出left+right+i=0的情况.
            //在查找过程中,根据sortedNums[i] + sortedNums[left] + sortedNums[right]的和来判断左移还是右移
            for i in 0 ..< sortedNums.count - 2 {
                //如果sortedNums[i]>0,则表示所有数都大于零,三个数之和肯定大于0,直接跳出循环即可
                if sortedNums[i] > 0 {
                    break;
                }
                //跳过重复的情况
                //sortedNums[i] == sortedNums[i - 1]表示当前数和上个数相等,上个数已经查找过了,因此不再查找
                if i>0 && sortedNums[i] == sortedNums[i - 1] {
                    continue
                }
                var left : Int = i + 1
                var right: Int  = sortedNums.count - 1
                while left < right {
                    let num = sortedNums[i] + sortedNums[left] + sortedNums[right]
                    if num == 0 {//当和为零时,表示找到一组数,left和right同时移动.
                        thressSumArray.append([sortedNums[i],sortedNums[left],sortedNums[right]])
                        
                        //如果遇到重复的数,则持续移动.重复的数和的结果不变
                        while left < right && sortedNums[left] == sortedNums[left + 1] {
                            left += 1
                        }
                        while left < right && sortedNums[right] == sortedNums[right - 1] {
                            right -= 1
                        }
                        right -= 1;
                        left += 1;
                    }else if num > 0 {//num>0表示right下标的数值过大,因此right左移一步
                        right -= 1;
                    }else {//num<0表示left下标的数值过小,因此left右移一步
                        left += 1;
                    }
                }
            }
            return thressSumArray
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
