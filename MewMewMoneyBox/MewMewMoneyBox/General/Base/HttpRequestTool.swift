//
//  HttpRequestTool.swift
//  MewMewMoneyBox
//
//  Created by 张青明 on 15/9/2.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//
//  http网络请求管理

import UIKit
import Foundation

import Alamofire
import SwiftyJSON

enum LoginCode:Int
{
    case Success       = 100
    case UserNotExist  = 102
    case PasswordError = 104
    case SystemError   = 500
}

let LoginResponseCode = (
    Success       : 100, /*用户登录成功*/
    UserNotExist  : 102, /*用户不存在*/
    PasswordError : 104, /*用户密码错误*/
    SystemError   : 500  /*系统错误*/
)


class HttpRequestTool
{
    
    /// 用户登录
    class func login(#userName:String, password:String)
    {
        //
        var parameters:[String: String] = ["userName":userName, "password":password]
        request(.GET, kURLApplyToLogin, parameters: parameters, encoding: ParameterEncoding.URL).responseJSON(options: NSJSONReadingOptions.AllowFragments) { (_, _, jsonData, error) -> Void in
            if error != nil
            {
                print("error:\(error)\n")
            }
            else
            {
                let json = JSON(jsonData!)
                
                switch(json["code"].intValue)
                {
                case LoginResponseCode.Success:
                    print("Success\n")
//                    HttpRequestTool.show("success")
//                    UIApplication.sharedApplication().delegate?.window.root
                case LoginResponseCode.UserNotExist:
                    print("UserNotExist\n")
                case LoginResponseCode.PasswordError:
                    print("PasswordError\n")
                case LoginResponseCode.SystemError:
                    print("SystemError\n")
                default:
                    print("other\n")
                }

                if let dic = JSON(jsonData!).dictionaryObject
                {
                    dic["code"]
                }
                print("jsonData:\(jsonData)\n\n")
            }
        }
//        return false
    }
    
    class func showAlert(title:String? = nil, message:String? = nil, delegate: AnyObject? = nil, cancelButtonTitle: String? = nil) {
        UIAlertView(title: "提示", message: message, delegate: self, cancelButtonTitle: cancelButtonTitle).show()
    }
    class func show(message:String?)
    {
        UIAlertView(title: nil, message: message, delegate: self, cancelButtonTitle: "确认").show()
    }
    
}
