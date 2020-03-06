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
        
        let sortedArray = candidates.sorted()
        for i in 0 ..< sortedArray.count - 1 {
            
        }
        
        return result
    }
    
    func <#name#>(<#parameters#>) -> <#return type#> {
        <#function body#>
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
