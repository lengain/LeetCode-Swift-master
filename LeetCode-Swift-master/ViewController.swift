//
//  ViewController.swift
//  LeetCode-Swift-master
//
//  Created by lengain on 2019/1/14.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class SubjectModel: NSObject {
    var title : String?
    var className : String?
    
    class func initWith(title : String, className : String) -> SubjectModel {
        let model = SubjectModel()
        model.title = title
        model.className = className
        return model
    }
}

class ViewController: UITableViewController {
    
    let dataSource : [SubjectModel] = [
        SubjectModel.initWith(title: "63. 不同路径2", className: "Q63ViewController"),
        SubjectModel.initWith(title: "62. 不同路径", className: "Q62ViewController"),
        SubjectModel.initWith(title: "57. 插入区间", className: "Q57ViewController"),
        SubjectModel.initWith(title: "56. 合并区间", className: "Q56ViewController"),
        SubjectModel.initWith(title: "55. 跳跃游戏", className: "Q55ViewController"),
        SubjectModel.initWith(title: "54. 螺旋矩阵", className: "Q54ViewController"),
        SubjectModel.initWith(title: "53. 最大子序和", className: "Q53ViewController"),
        SubjectModel.initWith(title: "48. 旋转图像", className: "Q48ViewController"),
        SubjectModel.initWith(title: "45. 跳跃游戏2", className: "Q45ViewController"),
        SubjectModel.initWith(title: "42. 接雨水", className: "Q42ViewController"),
        SubjectModel.initWith(title: "41. 缺失的第一个正数", className: "Q41ViewController"),
        SubjectModel.initWith(title: "40. 组合总和II", className: "Q40ViewController"),
        SubjectModel.initWith(title: "39. 组合总和", className: "Q39ViewController"),
        SubjectModel.initWith(title: "35. 搜索插入位置", className: "Q35ViewController"),
        SubjectModel.initWith(title: "34. 在排序数组中查找元素的第一个和最后一个位置", className: "Q34ViewController"),
        SubjectModel.initWith(title: "33. 搜索旋转排序数组", className: "Q33ViewController"),
        SubjectModel.initWith(title: "31. 下一个排列", className: "Q31ViewController"),
        SubjectModel.initWith(title: "26. 删除排序数组中额重复项", className: "Q26ViewController"),
        SubjectModel.initWith(title: "18. 4 Sum", className: "FourSumViewController"),
        SubjectModel.initWith(title: "16. 3 Sum closest", className: "ThressSumClosestViewController"),
        SubjectModel.initWith(title: "15. 3 Sum", className: "ThreeSumViewController"),
        SubjectModel.initWith(title: "11. Container With Most Water", className: "LNContainerWaterViewController"),
        SubjectModel.initWith(title: "5. Longest Palindromic Substring", className: "LongestPalindromicSubstringViewController"),
        SubjectModel.initWith(title: "? 4. Median of Two Sorted Arrays", className: "TwoSortedArrayMedianViewController"),
        SubjectModel.initWith(title: "3. Longest Substring Without Repeating Characters", className: "LongestSubstringViewController"),
        SubjectModel.initWith(title: "2. Add Two Numbers", className: "AddTwoNumbersViewController"),
        SubjectModel.initWith(title: "1. Two Sum", className: "TwoSumViewController"),
    ]

    let UITableViewCellReuseId = "ViewController.UITableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView .register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCellReuseId);

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellReuseId, for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.text = self.dataSource[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let className : NSString = self.dataSource[indexPath.row].className! as NSString
        let detailViewController = self.viewController(vcName: className as String);
        detailViewController?.hidesBottomBarWhenPushed = true
        if detailViewController != nil {
            self.navigationController?.pushViewController(detailViewController!, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func viewController(vcName:String) -> UIViewController? {
        // -1.动态获取命名空间
        guard let dict = Bundle.main.infoDictionary else {
            return nil
        }
        guard let cFBundleExecutable = dict["CFBundleExecutable"] else {
            return nil
        }
        let ns = cFBundleExecutable as! String
        
        // 0 .将字符串转换为类
        // 0.1默认情况下命名空间就是项目的名称, 但是命名空间名称是可以修改的
        // ns不能含有中文 ,不能以数字开头,不能有-,不要带有swift 否则会出现奇怪的问题,或者以类名创建类(NSClassFromString)的时候会返回nil
        // 可以去修改命名空间
        guard let cls:AnyClass = NSClassFromString(ns + "." + vcName) else {
            return nil
        }
        // 0.2通过类创建对象
        // 0.2.1将AnyClass转换为指定的类型
        let vcCls = cls as! UIViewController.Type
        // 0.2.2通过class创建对象
        let vc = vcCls.init()
        
        return vc
    }
    
}


