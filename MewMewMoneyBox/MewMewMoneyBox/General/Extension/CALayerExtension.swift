//
//  CALayerExtension.swift
//  MewMewMoneyBox
//
//  Created by 张青明 on 15/8/21.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

import UIKit

extension CALayer {
    
    // --> .xib/.storyboard
    // --> Show the Identity inspector
    // -->User Defined Runtime Attributes
    // 添加如下属性:
    // layer.cornerRadius  圆角        Number
    // layer.borderWidth   边宽宽度     Number
    // layer.borderUIColor 边宽颜色     Color
    var borderUIColor:UIColor {
        get{
            return UIColor(CGColor: self.borderColor)!
        }
        set(newValue) {
            self.borderColor = newValue.CGColor
        }
    }
    
}