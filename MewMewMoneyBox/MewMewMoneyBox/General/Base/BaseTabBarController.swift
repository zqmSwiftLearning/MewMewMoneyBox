//
//  BaseTabBarController.swift
//  MewMew
//
//  Created by 张青明 on 15/7/13.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        UINavigationController(rootViewController: PiggyBankTableViewController)
        var piggyBankNav = BaseNavigationController(rootViewController: PiggyBankTableViewController())
        piggyBankNav.tabBarItem = UITabBarItem(title: "我的储蓄罐", image: UIImage(named: "tabbarBoxNormal"), selectedImage: UIImage(named: "tabbarBoxSelected"))
//        piggyBankNav.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: ""), style: UIBarButtonItemStyle.Done, target: self, action: "")
        
        var taskLobbyNav = BaseNavigationController(rootViewController: TaskLobbyTableViewController())
        taskLobbyNav.tabBarItem = UITabBarItem(title: "任务大厅", image: UIImage(named: "tabbarTaskNormal"), selectedImage: UIImage(named: "tabbarTaskSelected"))
        
        self.viewControllers = [piggyBankNav, taskLobbyNav]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - 只调用一次
    override class func initialize(){
        self.setupTabBarItem()
    }
    
    // MARK: - 设置TabBarItem属性
    class func setupTabBarItem() {
        var tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 254.0/255.0, green: 84.0/255.0, blue: 38.0/255.0, alpha: 1.0)
//        tabBar.selectedItem?.selectedImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
