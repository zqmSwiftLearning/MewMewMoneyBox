//
//  LoginViewController.swift
//  MewMewMoneyBox
//
//  Created by 张青明 on 15/8/28.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UIStoryboard相关
    
    /// 用户名/手机号、密码、登录按钮的容器view
    @IBOutlet weak var loginView: UIView!
    
    /// 用户名/手机号
    @IBOutlet weak var ttfUserName: UITextField!
    
    /// 密码
    @IBOutlet weak var ttfPassword: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    /**
    登录
    */
    @IBAction func loginOnClick(sender: AnyObject) {
        HttpRequestTool.login(userName: ttfUserName.text, password: ttfPassword.text)
    }
    
    /**
    注册
    */
    @IBAction func registerOnClick(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        var register = UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController() as! RegisterViewController
        self.presentViewController(register, animated: true) { () -> Void in
            
        }
    }
    
    /**
    忘记密码/找回密码
    */
    @IBAction func retrievePasswordOnClick(sender: AnyObject) {
    }
    
    /**
    微信登录
    */
    @IBAction func loginByWeChatOnClick(sender: AnyObject) {
    }
    
    /**
    微博登录
    */
    @IBAction func loginByWeiBoOnClick(sender: AnyObject) {
    }
    
    
    // MARK: - 自定义属性
    
    /// loginView的原始Frame
    var loginViewOriginalFrame:CGRect = CGRectZero
    
    /// loginView在Y上的偏移量
    var loginViewOffsetY:CGFloat = 0.0
    
    /// 键盘是否弹出
    var hasKeyboardShowAnimation = false
    
    // MARK: - 系统
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.backgroundColor = GlobalColor
        
        self.addKeyboardNotification()
        
    }

    
    override func viewDidAppear(animated: Bool) {
        
        self.loginViewOriginalFrame = self.loginView.frame
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    // MARK: - 键盘弹出
    func keyboardWillShow(notification: NSNotification)
    {
        /// 键盘弹出时间
        let duration:NSTimeInterval = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSTimeInterval)!
        
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue()
        {
            
            if self.loginView.frame.maxY > keyboardSize.origin.y || self.hasKeyboardShowAnimation
            {
                self.loginViewOffsetY = self.loginView.frame.maxY - keyboardSize.origin.y
                
                self.hasKeyboardShowAnimation = true
                UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    self.loginView.frame.offset(dx: 0, dy: -self.loginViewOffsetY)
                    }, completion: nil)
                
            }
            
            
        }
        
    }
    
    // MARK: - 键盘隐藏
    func keyboardWillHide(notification: NSNotification)
    {
        /// 键盘隐藏时间
        let duration:NSTimeInterval = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSTimeInterval)!
        
        self.hasKeyboardShowAnimation = false
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue()
        {
            //            print("keyboardSize:\(keyboardSize)\n\n")
            // 与原始的frame不一致，即产生过偏移,更精确为大于当前maxY
            if self.loginViewOriginalFrame.maxY != self.loginView.frame.maxY
            {
                UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    self.loginView.frame.offset(dx: 0, dy: self.loginViewOriginalFrame.maxY - self.loginView.frame.maxY)
                    }, completion: nil)
            }
            
            
        }
        
    }
    
    
    /// 点击view
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    // MARK: - 添加键盘监听
    func addKeyboardNotification()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }

    // MARK: - 移除监听
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}
