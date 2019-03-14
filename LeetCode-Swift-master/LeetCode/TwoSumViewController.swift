//
//  TwoSumViewController.swift
//  LeetCode-Swift-master
//
//  Created by lengain on 2019/1/14.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class TwoSumViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Solution1.twoSum([2,7,11,5], 9))
        print(Solution1.twoSum([2,7,11,5], 13))
        print(Solution1.twoSum([2,7,11,5], 18))
        print()
        print(Solution2.twoSum([2,7,11,5], 9))
        print(Solution2.twoSum([2,7,11,5], 13))
        print(Solution2.twoSum([2,7,11,5], 18))
        print()
        print(Solution3.twoSum([2,7,11,5], 9))
        print(Solution3.twoSum([2,7,11,5], 13))
        print(Solution3.twoSum([2,7,11,5], 18))
    }
    
    /// 方法一：暴力破解法
    /// 复杂度分析：
    /// 时间复杂度：O(n^2)， 对于每个元素，我们试图通过遍历数组的其余部分来寻找它所对应的目标元素，这将耗费 O(n)的时间。因此时间复杂度为 O(n^2)
    /// 空间复杂度：O(1)
    class Solution1 {
        class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            for i in 0..<nums.count {
                for j in i + 1..<nums.count {
                    if nums[i] + nums[j] == target {
                        return [i,j]
                    }
                }
            }
            return [];
        }
    }
    /// 方法二：两遍哈希表
    /// 为了对运行时间复杂度进行优化，我们需要一种更有效的方法来检查数组中是否存在目标元素。如果存在，我们需要找出它的索引。保持数组中的每个元素与其索引相互对应的最好方法是什么？哈希表。
    /// 通过以空间换取速度的方式，我们可以将查找时间从 O(n) 降低到 O(1)。哈希表正是为此目的而构建的，它支持以 近似 恒定的时间进行快速查找。我用“近似”来描述，是因为一旦出现冲突，查找用时可能会退化到 O(n)。但只要你仔细地挑选哈希函数，在哈希表中进行查找的用时应当被摊销为 O(1)。
    /// 一个简单的实现使用了两次迭代。在第一次迭代中，我们将每个元素的值和它的索引添加到表中。然后，在第二次迭代中，我们将检查每个元素所对应的目标元素（target - nums[i]）是否存在于表中。注意，该目标元素不能是 nums[i]nums[i] 本身！
    class Solution2 {
        class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            let values = NSMutableDictionary.init()
            for i in 0..<nums.count {
                values.setValue(NSNumber.init(value: i), forKey: "\(nums[i])")
            }
            let setKeys = NSSet.init(array: nums);
            for i in 0..<nums.count {
                let diff = target - nums[i];
                if setKeys.contains(diff) {
                    let index : NSNumber = values.object(forKey: "\(diff)") as! NSNumber
                    if index.intValue != i {
                        return [i,index.intValue]
                    }
                }
            }
            return []
        }
    }
    
    class Solution3 {
        class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            let values = NSMutableDictionary.init()
            for i in 0..<nums.count {
                values.setValue(NSNumber.init(value: i), forKey: "\(nums[i])")
                let setKeys = NSSet.init(array: values.allKeys);
                let diff = target - nums[i];
                if setKeys.contains("\(diff)") {
                    let index : NSNumber = values.object(forKey: "\(diff)") as! NSNumber
                    if index.intValue != i {
                        return [index.intValue, i]
                    }
                }
            }
            return []
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
