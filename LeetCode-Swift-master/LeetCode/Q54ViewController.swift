//
//  Q54ViewController.swift
//  LeetCode-Swift-master
//
//  Created by 童玉龙 on 2020/3/13.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q54ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(self.spiralOrder([
          [1, 2, 3, 4,5],
          [5, 6, 7, 8,9],
          [9,10,11,12,15],
          [13,14,15,16,17],
        ]))
        
        print(self.spiralOrder([
          [1, 2, 3, 4],
          [5, 6, 7, 8],
          [9,10,11,12]
        ]))
        
        print(self.spiralOrder([
         [ 1, 2, 3 ],
         [ 4, 5, 6 ],
         [ 7, 8, 9 ]
        ]))
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 {
            return[]
        }
        var result = [Int].init()
        var i = 0
        var j = 0
        var direction = 0
        let width = matrix[0].count - 1
        let height = matrix.count - 1
        var circleCount = 0
        while result.count < (width + 1) * (height + 1) {
            result.append(matrix[i][j])
            switch direction {
            case 0:
                j += 1
                if j == width - circleCount + 1 {
                    direction = 1
                    circleCount += 1
                    j = width - circleCount + 1
                    i += 1
                }
            case 1:
                i += 1
                if i == height - circleCount + 2 {
                    direction = 2
                    i = height - circleCount + 1
                    j -= 1
                }
            case 2:
                j -= 1
                if j < circleCount - 1 {
                    j = circleCount - 1
                    direction = 3
                    i -= 1
                }
            case 3:
                i -= 1
                if i == circleCount - 1 {
                    i = circleCount
                    direction = 0
                    j += 1
                }
            default:
                break
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
