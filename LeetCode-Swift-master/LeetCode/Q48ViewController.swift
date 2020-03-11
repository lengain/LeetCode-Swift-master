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
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
        self.rotate(&matrix)
        /*
         out matrix = [
             [7,4,1],
             [8,5,2],
             [9,6,3]
         ]
         */
        print(matrix)
    }
    
    
    func rotate(_ matrix: inout [[Int]]) {
        /*
         发现规律
         a[0][0] -> a[0][2]
         a[0][1] -> a[1][2]
         a[0][2] -> a[3][2]
         a[i][j] -> a[j][a.count - 1 - i]
         开始交换时
         
         a[0][0] -> a[0][2]
         a[0][2] -> a[2][2]
         a[2][2] -> a[2][0]
         a[2][0] -> a[0][0]
          */
        let row = matrix.count - 1
//        for i in 0 ... row {
//            let rowNums = matrix[i]
//            for j in 0 ..< rowNums.count {
//                print(matrix[j][row - i])
//            }
//        }
        
        let firstRowArray = matrix[0]
        
        for line in 0 ..< firstRowArray.count {
            var i = 0
            var j = line
            let firstExchangeValue = matrix[i][j]
            var temp : Int? = nil
            while true  {
                let targetI = j
                let targetJ = row - i
                if (temp != nil) {
                    
                }
                temp = matrix[targetI][targetJ]
                if temp == firstExchangeValue {
                    break
                }
                matrix[targetI][targetJ] = matrix[i][j]
                i = targetI
                j = targetJ
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
