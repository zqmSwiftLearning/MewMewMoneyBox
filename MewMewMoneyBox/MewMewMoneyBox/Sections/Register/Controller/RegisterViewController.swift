//
//  RegisterViewController.swift
//  MewMewMoneyBox
//
//  Created by 张青明 on 15/8/31.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - UIStoryboard相关
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottomLineView: UIView!
    
    /// 注册按钮
    @IBOutlet weak var registerButton: UIButton!
    
    /// 手机号码、输入验证码、密码、注册按钮、我已阅读并同意、使用条款和隐私政策 的视图容器
    @IBOutlet weak var registerView: UIView!
    /**
    返回
    */
    @IBAction func dismissViewCtrlOnClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    // MARK: - 自定义属性
    
    /// registerButton的原始Frame
    var registerButtonOriginalFrame:CGRect = CGRectZero
    
    /// 视图容器的原始Frame
    var registerViewOriginalFrame:CGRect   = CGRectZero
    
    /// view的原始Frame
    var viewOriginalFrame:CGRect = CGRectZero
    
    /// bottomLineView在Y上的偏移量
    var bottomLineViewOffsetY:CGFloat = 0.0
    
    /// registerButton在Y上的偏移量
    var registerButtonOffsetY:CGFloat = 0.0
    
    /// 键盘是否弹出
    var hasKeyboardShowAnimation = false

    // MARK: - 系统
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addKeyboardNotification()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.registerButtonOriginalFrame = self.view.convertRect(self.view.frame, fromView: self.registerButton)
        self.viewOriginalFrame = self.view.frame
        self.registerViewOriginalFrame   = self.registerView.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func dismissRegisterViewCtrl()
    {
        self.navigationController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    
    
    
    // MARK: - 键盘弹出
    func keyboardWillShow(notification: NSNotification)
    {
        /// 键盘弹出时间
        let duration:NSTimeInterval = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSTimeInterval)!
        
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue()
        {
            
            var registerButtonFrame = self.view.convertRect(self.view.frame, fromView: self.registerButton)
            
            if registerButtonFrame.minY > keyboardSize.origin.y || self.hasKeyboardShowAnimation
            {
                self.registerButtonOffsetY = registerButtonFrame.minY - keyboardSize.origin.y
                self.hasKeyboardShowAnimation = true
                
                weak var weakSelf = self
                UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    self.view.frame.offset(dx: 0, dy: -weakSelf!.registerButtonOffsetY)
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
            if self.registerButtonOriginalFrame.maxY != self.registerButton.frame.maxY
            {
                
                weak var weakSelf = self
                
                UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//                    self.registerView.frame.offset(dx: 0, dy: self.registerViewOriginalFrame.maxY - self.registerView.frame.maxY)
//                    self.view.frame.offset(dx: 0.0, dy: weakSelf!.registerButtonOffsetY)
//                    self.registerView.frame = self.registerViewOriginalFrame
                    self.view.frame = self.viewOriginalFrame
                    print("self.registerViewOriginalFrame:\(self.registerViewOriginalFrame)\n\n")
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
