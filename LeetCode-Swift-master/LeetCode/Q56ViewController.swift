//
//  Q56ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/13.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q56ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.merge([[5,5],[1,2],[2,4],[2,3],[4,4],[5,5],[2,3],[5,6],[0,0],[5,6]]))
        print(self.merge([[1,4],[1,4]]))
        print(self.merge([[1,3],[2,6],[8,10],[15,18]]))
    }
    
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals;
        }
        let sortedIntervals = intervals.sorted { (a, b) -> Bool in
            return a.first! < b.first!
        }
        var result = [[Int]].init()
        var temp = sortedIntervals.first!
        for i in 1 ..< sortedIntervals.count {
            let item = sortedIntervals[i]
            if item.first! <= temp.last! {
                if temp[1] < item[1] {
                    temp[1] = item[1]
                }
            }else {
                result.append(temp)
                temp = item
            }
            if i == sortedIntervals.count - 1 {
                  result.append(temp)
            }
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
