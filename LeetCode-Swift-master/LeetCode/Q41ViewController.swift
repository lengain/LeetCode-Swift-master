//
//  Q41ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/8.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q41ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.firstMissingPositive([1]))
        print(self.firstMissingPositive([7,8,9,10]))
        print(self.firstMissingPositive([3,4,-1,1]))//2
    }

    func firstMissingPositive(_ nums: [Int]) -> Int {
        let n = nums.count
        //剔除数据数量为1的情况
        if n == 0 {
            return 1
        }
        
        //剔除1不存在的情况，下面要用到1标记
        var contains = 0;
        for i in 0 ..< n {
            if nums[i] == 1 {
                contains += 1
                break;
            }
        }
        if contains == 0 {
            return 1
        }
        var numsCopy = nums
        //开始循环，排除0，负数 ,比n大的数
        for i in 0 ..< n {
            if numsCopy[i] < 1 || numsCopy[i] > n {
                numsCopy[i] = 1
            }
        }
        //将下标为 元素值a的那个数，改为负数
        for i in 0 ..< n {
            let a = abs(numsCopy[i])
            if a == n {
                numsCopy[0] = -abs(numsCopy[0])
            }else {
                numsCopy[a] = -abs(numsCopy[a])
            }
        }
        
        //找到大于0的数，说明这个数没有被翻转
        for i in 1 ..< n {
            if numsCopy[i] > 0 {
                return i;
            }
        }
        
        if numsCopy[0] > 0 {
            return n
        }
        return n + 1
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
