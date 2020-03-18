//
//  Q62ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/18.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q62ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.uniquePaths(23, 12))
        print(self.uniquePaths(2, 3))
        print(self.uniquePaths(3, 2))
        print(self.uniquePaths(7, 3))
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return max(m, n)
        }
        var array : [[Int]] = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
        for i in 1 ..< m {
            for j in 1 ..< n {
                array[i][j] = array[i-1][j] + array[i][j-1]
            }
        }
        return array[m - 1][n - 1]
    }
    
    func uniquePaths1(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return max(m, n)
        }
        var step = 0
        
        self.traverseTo(mStart: 1, nStart: 1, m: m, n: n) {
            step += 1
        };
        return step
    }

    func traverseTo(mStart:Int,nStart:Int, m: Int, n: Int, result : ()-> Void) {
        if mStart >= m && nStart >= n {
            result()
            return;
        }
        if mStart < m  {
            var mS = mStart
            mS += 1
            self.traverseTo(mStart: mS, nStart: nStart, m: m, n: n, result: result)
        }
        if nStart < n {
            var nS = nStart
            nS += 1
            self.traverseTo(mStart: mStart, nStart: nS, m: m, n: n, result: result)
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
