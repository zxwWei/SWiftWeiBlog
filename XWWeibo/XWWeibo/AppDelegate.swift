//
//  AppDelegate.swift
//  XWWeibo
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 ZXW. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 启动时输出保存的数据
        print("启动 account:\(XWUserAccount.loadAccount())")
        
        
        // MARK: - 在一开始的时候设置导航条全局属性
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
            
        // 设置frame
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        // ? 有值的时候执行后面的代码
        window?.makeKeyAndVisible()
        //print("初始化")
        // 创建tabbar
        let tabBarVc = XWMainTabBarController()
        
        window?.rootViewController = tabBarVc
        
        return true
    }
    
}




