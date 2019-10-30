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
    /// 移动较短的指针.
    /// 双指针法有两个地方说明:
    /// 第一:必须从最外两侧开始向内移动,因为最大区域一定在最外两侧之内.
    /// 第二:为什么向内移动短板不会错过最大区域?
    /// 假设宽度为w,长板为m,短板为n
    /// 目前的区域大小为:n * w
    /// 如果向内移动长版后为m1: 第一种情况 m1 > n,则 区域大小是 n * (w-1)
    ///                    第二种情况 m1 < n,则区域大小是 m1 * (w-1),这个面积小于n * (w-1)
    ///                    两种情况,区域都会变小
    /// 如果移动短板后为n1:第一种情况n1 > n 则区域大小变为 n1 *(w-1) 或 m * (w -1),则有可能大于 n * w
    /// 因此,要一直移动短板即可
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
