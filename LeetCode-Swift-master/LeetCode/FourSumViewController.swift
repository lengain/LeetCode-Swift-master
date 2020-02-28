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
    
    //此答案根据一下链接中作者答案做出
    //https://leetcode-cn.com/problems/4sum/solution/ji-bai-9994de-yong-hu-you-dai-ma-you-zhu-shi-by-yo/
    class Solution1 {
        class func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
            if nums.count < 4 {
                return []
            }
            
            var result : [[Int]] = []
            
            let sortedNums : [Int] = nums.sorted(by: < )
            //定义4个指针 k,i,j,h
            //k从0开始遍历，i从 k+1 开始遍历，留下j和h,j指向i+1,h指向数组最大值
            let length = sortedNums.count
            for k in 0 ..< length-3 {
                //当k值和前面的相等时忽略
                if k > 0 && sortedNums[k - 1] == sortedNums[k] {
                    continue;
                }
                //获取当前最小值，如果最小值比目标值大，说后后面越来越大，无效
                let min1 = sortedNums[k] + sortedNums[k + 1] + sortedNums[k + 2] + sortedNums[k + 3]
                if min1 > target {
                    break
                }
                //获取当前循环中的最大值，如果最大值比目标小，无效，继续下一个数
                let max1 = sortedNums[k] + sortedNums[length - 1] + sortedNums[length - 2] + sortedNums[length - 3]
                if max1 < target {
                    continue
               
                }
                //第二层循环 i 初始值指向 k + 1
                for i in k + 1 ..< length - 2 {
                    //当i的值与前面的值相等时忽略
                    if i > k + 1 && sortedNums[i] == sortedNums[i - 1] {
                        continue
                    }
                    //定义指针j指向i+1
                    var j = i + 1
                    //定义指针h指向数组末尾
                    var h = length - 1
                    
                    //获取第二层循环中的最小值，如果最小值比目标值大，说明后面越来越大，结束
                    let min = sortedNums[k] + sortedNums[i] + sortedNums[j] + sortedNums[j + 1]
                    if min > target {
                        break
                    }
                    //获取第二层循环中的最大值，如果最大值比目标值小，则继续循环
                    let max = sortedNums[k] + sortedNums[i] + sortedNums[h] + sortedNums[h - 1]
                    if max < target {
                        continue
                    }
                    //开始j指针和h指针的表演。
                    //计算当前的和，如果等于目标值，j++并去重，h--并去重
                    //当当前和大于目标值是h--，
                    //当当前和小于目标值时j++
                    while j < h {
                        let current = sortedNums[k] + sortedNums[i] + sortedNums[j] + sortedNums[h]
                        if current == target {
                            result.append([sortedNums[k], sortedNums[i] , sortedNums[j] , sortedNums[h]])
                            
                            j += 1
                            while j < h && sortedNums[j] == sortedNums[j-1] {
                                j += 1
                            }
                            
                            h -= 1
                            while j < h && i < h && h + 1 < length && sortedNums[h] == sortedNums[h + 1] {
                                h -= 1
                            }
                            
                        }else if current < target {
                            j += 1
                        }else {
                            h -= 1
                        }
                    }
                    
                }
                
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
