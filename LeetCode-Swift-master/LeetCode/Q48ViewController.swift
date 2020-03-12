//
//  Q48ViewController.swift
//  LeetCode-Swift-master
//
//  Created by shunlian on 3/11/20.
//  Copyright © 2020 Lengain. All rights reserved.
//

import UIKit

class Q48ViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        var matrix = [
            [1,2,3,4],
            [5,6,7,8],
            [9,10,11,12],
            [13,14,15,16],
        ]
        self.rotate(&matrix)
        /*
         out matrix = [
             [13,9,5,1],
             [14,10,6,2],
             [15,11,7,3],
             [16,12,8,4],
         ]
         */
        print(matrix)
        
        var matrix1 = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
        self.rotate(&matrix1)
        /*
         first
         
         out matrix = [
             [1,4,7],
             [2,5,8],
             [3,6,9]
         ]
         
         out matrix = [
             [7,4,1],
             [8,5,2],
             [9,6,3]
         ]
         */
        print(matrix1)
    }
    
    
    func rotate(_ matrix: inout [[Int]]) {
      //两次转换，第一次ij互换
        
        var temp = 0
        let count = matrix[0].count
        for i in 0 ..< matrix.count  {
            for j in i ..< count {
                temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        //第二次 左右交换
        
        for i in 0 ..< matrix.count {
            let count = matrix[i].count
            for j in 0 ..< count / 2 {
                temp = matrix[i][j]
                matrix[i][j] = matrix[i][count - 1 - j]
                matrix[i][count - 1 - j] = temp
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
