//
//  Q42ViewController.swift
//  LeetCode-Swift-master
//
//  Created by shunlian on 3/9/20.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q42ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print(self.trap([5,2,1,2,1,5]))
        print(self.trap([5,4,1,2]))
        print(self.trap([2,0,2]))
        print(self.trap([0,4,3,0,2,5]))
        print(self.trap([0,1,0,2,1,0,1,3,2,1,2,1]))
    }
    
    func trap(_ height: [Int]) -> Int {
        if height.count == 0 {
            return 0
        }
        
        var valume : Int = 0
        
        let count = height.count
        var startIndex = -1
        var endIndex = -1
        for i in 0 ..< count - 1 {
            //寻找startIndex
            if startIndex == -1 {
                if height[i] > height[i + 1] {
                    startIndex = i
                }
            }
            //找到startIndex后，开始寻找endIndex
            if startIndex >= 0 {
                if height[i] < height[i + 1] {
                    endIndex = i + 1
                }
                //找到第一个endIndex，因为有可能出现[5,2,1,2,1,5]这种多个波峰这种，因此要判断后面是否有新的endIndex
                if endIndex >= 0 && (height[i] > height[i + 1]  || i + 1 == count - 1) {
                    //找出最后的endIndex
                    for j in endIndex ... count - 1 {
                        if height[j] > height[endIndex] {
                            endIndex = j
                        }
                        if height[j] >= height[startIndex] {
                            endIndex = j
                            break
                        }
                    }
                    if i + 1 < endIndex {
                        continue
                    }
                    valume += self.calculateVolume(height: height, startIndex: startIndex, endIndex: endIndex)
                    startIndex = i
                    endIndex = -1
                }
            }
            
        }
        return valume
    }
    
    func calculateVolume(height: [Int],startIndex:Int, endIndex:Int) -> Int {
        var valume = 0
        let maxHeight = min(height[startIndex], height[endIndex])
        for i in startIndex + 1 ..< endIndex {
            if maxHeight > height[i] {
                valume += (maxHeight - height[i])
            }
        }
        return valume
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
