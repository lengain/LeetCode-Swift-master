//
//  ViewController.swift
//  LeetCode-Swift-master
//
//  Created by lengain on 2019/1/14.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataSource : [[String : String]] = [["title":"1. Two Sum","className":"TwoSumViewController"],
                                            ["title":"2. Add Two Numbers","className":"AddTwoNumbersViewController"],
                                            ["title":"3. Longest Substring Without Repeating Characters","className":"LongestSubstringViewController"],
                                            ["title":"? 4. Median of Two Sorted Arrays","className":"TwoSortedArrayMedianViewController"],
                                            ["title":"5. Longest Palindromic Substring","className":"LongestPalindromicSubstringViewController"],
                                            ["title":"11. Container With Most Water","className":"LNContainerWaterViewController"],
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
        cell.textLabel?.text = self.dataSource[indexPath.row]["title"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let className : NSString = self.dataSource[indexPath.row]["className"]! as NSString
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


