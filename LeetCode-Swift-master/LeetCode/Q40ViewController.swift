//
//  Q40ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/7.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q40ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.combinationSum2([2,5,2,1,2], 5))
        print(self.combinationSum2([10,1,2,7,6,1,5], 8))
    }
    //回溯法+去重
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]].init()
        //[1,2,2,2,5] = 5
        let sortedNumbers = candidates.sorted()
        self.combination(sortedNumbers, startIndex: 0, target, limit: true) { (value) in
            result.append(value)
        }
        return result
    }
    
    func combination(_ candidates: [Int], startIndex: Int, _ target: Int, limit:Bool, callBack:(([Int]) -> ())) {
        
        for i in startIndex ..< candidates.count {
            //去重 同一级的跳过，继续
            if i > startIndex {
                if candidates[i] == candidates[i - 1] {
                    continue
                }
            }
            //比较
            let diff = target - candidates[i]
            
            if diff > 0 {
                self.combination(candidates, startIndex: i + 1, diff, limit: limit) { (value) in
                    var result = [Int].init()
                    result.append(candidates[i])
                    result.append(contentsOf: value)
                    callBack(result)
                }
            }else if(diff == 0) {
                callBack([candidates[i]])
            }
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
