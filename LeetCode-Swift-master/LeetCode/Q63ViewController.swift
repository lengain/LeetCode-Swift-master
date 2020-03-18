//
//  Q63ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/18.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q63ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.uniquePathsWithObstacles([
          [0,0],
          [1,1],
          [0,0],
        ]))
        print(self.uniquePathsWithObstacles([
          [1,0]
        ]))
        print(self.uniquePathsWithObstacles([
          [1]
        ]))
        print(self.uniquePathsWithObstacles([
          [0,0,0],
          [0,1,0],
          [0,0,0]
        ]))
    }
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        var nums = obstacleGrid;
        let count = nums.first!.count
        
        if obstacleGrid[nums.count - 1][count - 1] == 1 {
            return 0
        }
        
        for i in 0 ..< nums.count {
            var valid = true
            for j in 0 ..< count {
                if i == 0 || j == 0 {
                    if nums[i][j] == 1 || valid == false {
                        nums[i][j] = 0
                        valid = false
                    }else {
                        nums[i][j] = 1
                    }
                }else {
                    if nums[i][j] == 1 || nums[i - 1][j] == 0 {
                        nums[i][j] = 0
                        continue
                    }
                    nums[i][j] = nums[i - 1][j] + nums[i][j - 1]
                }
            }
        }
        print(nums)
        return nums[nums.count - 1][count - 1]
    }
    
    //下图面这种会超时。
    func uniquePathsWithObstacles1(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid[0][0] != 0 {
            return 0
        }
        var step = 0
        let m = obstacleGrid.count
        let n = obstacleGrid.first!.count
        self.traverseTo(mStart: 0, nStart: 0, m: m, n: n,obstacleGrid: obstacleGrid) {
            step += 1
        };
        return step
    }


    func traverseTo(mStart:Int,nStart:Int, m: Int, n: Int, obstacleGrid: [[Int]], result : ()-> Void) {
        if mStart >= m - 1 && nStart >= n - 1 {
            if obstacleGrid[mStart][nStart] == 0 {
                result()
            }
            return;
        }
        if mStart < m - 1 {
            var mS = mStart
            mS += 1
            if obstacleGrid[mS][nStart] == 0 {
                self.traverseTo(mStart: mS, nStart: nStart, m: m, n: n, obstacleGrid: obstacleGrid, result: result)
            }
            
        }
        if nStart < n - 1 {
            var nS = nStart
            nS += 1
            if obstacleGrid[mStart][nS] == 0 {
                self.traverseTo(mStart: mStart, nStart: nS, m: m, n: n, obstacleGrid: obstacleGrid, result: result)
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
