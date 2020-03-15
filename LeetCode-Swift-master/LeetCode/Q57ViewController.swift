//
//  Q57ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/15.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q57ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.insert([[1,5]], [0,6]))
        print(self.insert([[1,5]], [2,7]))
        print(self.insert([[1,5]], [2,3]))
        print(self.insert([[1,3],[6,9]], [2,5]))
        print(self.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))
    }
    
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if newInterval.count == 0 {
            return intervals
        }
        if intervals.count == 0 {
            return [newInterval]
        }
        var result = [[Int]].init()
        
        if intervals[0][0] > newInterval[1] {
            result.append(newInterval)
            result.append(contentsOf: intervals)
            return result
        }
        
        if intervals.last!.last! < newInterval[0] {
            result.append(contentsOf: intervals)
            result.append(newInterval)
            return result
        }
        
        var temp = newInterval
        let count = intervals.count
        for i in 0 ..< count  {
            let item = intervals[i]
            let startOverlap : Bool = (item[0] <= temp[0]) && (item[1] >= temp[0])
            let endOverLap : Bool = (item[0] <= temp[1]) && (item[1] >= temp[1])
            let inner : Bool = item[0] > temp[0] && item[1] < temp[1]
            if inner {
                continue
            }
            if startOverlap || endOverLap  {
                if startOverlap && item[0] < temp[0] {
                    temp[0] = item[0]
                }
                if endOverLap {
                    temp[1] = item[1]
                    result.append(temp)
                    
                    if i != count - 1 {
                        result.append(contentsOf: intervals[i + 1 ..< count])
                    }
                    break
                }
                
                if i == count - 1 {
                    result.append(temp)
                }
            }else {
                if temp[1] < item[0] {
                    result.append(temp)
                    result.append(item)
                    if i != count - 1 {
                        result.append(contentsOf: intervals[i + 1 ..< count])
                    }
                    break
                }
                result.append(item)
            }
        }
        if !result.contains(temp) {
            result.append(temp)
        }
        return result
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
