//
//  Q39ViewController.swift
//  LeetCode-Swift-master
//
//  Created by shunlian on 3/6/20.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q39ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.combinationSum([2,3,5], 8))
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]].init()
        let sortedNums = candidates.sorted()
        self.search(candidates: sortedNums, target: target, limit: target) { (value) in
            result.append(value)
        }
        return result
    }
    func search(candidates: [Int], target: Int, limit:(Int), callBack:(([Int]) -> ())) {
        for i in 0 ..< candidates.count {
            if candidates[i] <= target {
                //去重 剪枝
                //首先，程序执行减操作的时候，是排序后的，从小往大减的。
                //limit为上一次循环中减去的这个值。如果当前循环的值candidates[i]这个值比大，说明上面一层已经减过了，会重复。直接return
                if (limit < candidates[i]) {
                    return
                }
                
                let diff = target - candidates[i]
                if diff > 0 {
                    self.search(candidates: candidates, target: diff, limit: candidates[i]) { (value) in
                        var values = [Int].init()
                        values.append(contentsOf: value)
                        values.append(candidates[i])
                        callBack(values)
                    }
                }else if diff == 0 {
                    callBack([candidates[i]])
                }
                
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
