//
//  BaseNavigationController.swift
//  BuildYourHTTPRequestLibrary
//
//  Created by 张青明 on 15/6/26.
//  Copyright (c) 2015年 张青明. All rights reserved.
//

import UIKit

let TitleTextColor = UIColor.whiteColor()

let NavigationBar_BarTintColor = UIColor(red: 251.0/255.0, green: 80.0/255.0, blue: 38.0/255.0, alpha: 1.0)
let NavigationBar_TintColor = UIColor.whiteColor()

class BaseNavigationController: UINavigationController {
    

    
//    override init(rootViewController: UIViewController) {
//        super.init(rootViewController: rootViewController)
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func init(rootViewController: UIViewController) {
//    }
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    // MARK: - ============= 系统生命周期 =============
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    override init(rootViewController: UIViewController) {
//        super.init(rootViewController: rootViewController)
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    
    
    // MARK: - 只调用一次
    override class func initialize(){
        self.setupNavigationBar()
    }
    
    

    // MARK: - 重写push,添加自己的返回按钮
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0
        {
            var backButton = UIButton()
            backButton.setBackgroundImage(UIImage(named: "back"), forState: UIControlState.Normal)
            backButton.setBackgroundImage(UIImage(named: "back"), forState: UIControlState.Highlighted)
            backButton.addTarget(self, action: "popToForwardViewCtrl:", forControlEvents: UIControlEvents.TouchUpInside)
            
            var imageSize = backButton.currentBackgroundImage?.size
            
            backButton.frame = CGRectMake(0, 0, imageSize!.width, imageSize!.height)
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
            viewController.hidesBottomBarWhenPushed = true
            
        }
        super.pushViewController(viewController, animated: true)
        
        if self.respondsToSelector("interactivePopGestureRecognizer")
        {
            self.interactivePopGestureRecognizer.delegate = nil;
        }
    
    }
    
    func popToForwardViewCtrl(sender: UIButton!)
    {
        self.popViewControllerAnimated(true)
    }
    
    // MARK: - =============   修改UI属性   =============
    // MARK: - 设置导航条属性
    class func setupNavigationBar()
    {
        
        //获取导航条
        var navigationBar = UINavigationBar.appearance()
        
        //定义一个可变字典变量,用于保存bar属性
        var titleTextAttributes = NSMutableDictionary()
        
        //设置字体颜色
        titleTextAttributes.setValue(TitleTextColor, forKey: NSForegroundColorAttributeName)
        
        // TODO: 设置字体大小,属性名:NSFontAttributeName
        // 如果不需要,则不需要添加
        let font = UIFont(name: "STHeitiSC-Light", size: 17.0)
        titleTextAttributes.setValue(font, forKey: NSFontAttributeName)
        
        //设置bar title字体属性
        navigationBar.titleTextAttributes = titleTextAttributes as [NSObject : AnyObject]
        
        //设置bar样式,如果不设置,那么状态栏样式不会改变!! Translucent:半透明
        navigationBar.barStyle = UIBarStyle.Black
        //设置状态栏样式
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        
//        //设置bar背景图
//        navigationBar.setBackgroundImage(UIImage(named: "navigationBar"), forBarMetrics: UIBarMetrics.Default)
        
        // 设置bar背景颜色
        navigationBar.barTintColor = NavigationBar_BarTintColor
        
//        navigationBar.tintColor    = NavigationBar_TintColor

        
//        navigationBar.translucent = false
        

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
