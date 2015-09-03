//
//  UserInfoPropertyModel.swift
//  MewMewMoneyBox
//
//  Created by 张青明 on 15/9/2.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

/// 个人信息cell内容的属性模型
class UserInfoPropertyModel: NSObject {
    var icon:String = ""
    var content:String = ""
    
    override init() {
        super.init()
    }
    
    init(icon:String, content:String)
    {
        super.init()
        
        self.icon = icon
        self.content = content
    }
    
    class func arrayFromPlist(fileName: String? = "UserInfoProperties",  fileType: String? = "plist") -> NSArray
    {
        var userInfos = [UserInfoListModel]()
        
        var array:NSArray = NSArray()
        var plistPath = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
        if let path = plistPath
        {
            if let list = NSArray(contentsOfFile: path)
            {
                for item in list{
                    var model = UserInfoListModel()
                    
                    for (key, value) in item as! [String:String] {
                        model.setValue(value, forKey: key)
                    }
                    
                    userInfos.append(model)
                }
            }
            
        }
        
        return userInfos
    }
    
    
    //类实例的描述信息
    override var description: String {
        //TODO:自定义需要返回的描述信息内容
        return "\(super.description), icon:\(self.icon), content:\(self.content)\n"
    }
}
