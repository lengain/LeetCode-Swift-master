//
//  LNContainerWaterViewController.swift
//  LeetCode-Swift-master
//
//  Created by shunlian on 2019/10/29.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class LNContainerWaterViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(Solution2.maxArea([1,8,6,2,5,4,8,3,7]))
    }
    
    
    /// 暴力计算法
    /// 两遍遍历每一种情况,算出最大值,这种方法的时间复杂度为O(n^2),空间复杂度为O(n)
    /// 在LeetCode上因为Time Limit Exceeded造成失败.
    class Solution1 {
        class func maxArea(_ height: [Int]) -> Int {
            var maxArea: Int = 0;
            for (i , item) in height.enumerated() {
                for j in i + 1 ..< height.count {
                    let area = (j - i) * min(item,height[j])
                    if area > maxArea {
                        maxArea = area
                    }
                    print(area)
                }
            }
            return maxArea
        }
    }
    /// 双指针方法
    /// 移动较短的指针
    class Solution2 {
        class func maxArea(_ height: [Int]) -> Int {
            var maxArea: Int = 0;
            var startIndex = 0
            var endIndex = height.count - 1
            
            while startIndex < endIndex {
                
                let width = endIndex - startIndex
                let area = width * min(height[startIndex], height[endIndex])
                if maxArea < area {
                    maxArea = area
                }
                if height[startIndex] > height[endIndex] {
                    endIndex -= 1;
                }else {
                    startIndex += 1;
                }
            }
            return maxArea
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
