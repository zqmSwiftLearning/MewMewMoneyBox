//
//  URLConstants.swift
//  MewMewMoneyBox
//
//  Created by 张青明 on 15/9/2.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//
//  URL常量

import UIKit

let HOST = "http://192.168.31.214"
let PORT = "8111"
let BaseURL = HOST + ":" + PORT


 /// 用于登录,需要userName和password
let kURLApplyToLogin = BaseURL + "/userAdmin/login"