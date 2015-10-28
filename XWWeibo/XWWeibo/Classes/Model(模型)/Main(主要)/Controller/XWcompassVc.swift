//
//  XWcompassVc.swift
//  XWWeibo
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 ZXW. All rights reserved.
//

// MARK: - 让所有的四个控制器继承自它，让它们没登陆的时候都实现如下业务逻辑 显示这个界面
import UIKit

class XWcompassVc: UITableViewController {


    var userLogin = false
    
    // 当加载view的时候   如果用另外的view代替原有的view，则不再往下执行
    
    override func loadView() {
        
        // 当登陆成功的时候加载原先的view 不成功的时候加载 自定义的view
        userLogin ? super.loadView() : setupVistorView()

    }
    
    private func setupVistorView(){
        // 为什么要用XWCompassView呢 
        // 转换成xwcompassView
        let vistorView = XWCompassView()
        view = vistorView
        
        // 根据控制器的不同显示不同的信息
        if (self is XWHomeTableVC){
        
        }
        else if (self is XWMessageTableVC){
            vistorView.setupVistorView("你妹", rotationViewName: "visitordiscover_image_message")

        }
        else if (self is XWDiscoverTableVC){
            vistorView.setupVistorView("坑", rotationViewName: "visitordiscover_image_message")
        }
        else if (self is XWProfileTableVC){
            vistorView.setupVistorView("坑爹", rotationViewName: "visitordiscover_image_profile")
        }
        
        //vistorView.backgroundColor = UIColor.whiteColor()
    }
    
    
    
}
