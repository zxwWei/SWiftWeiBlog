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
        
        // 设置frame
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        // ??
        window?.makeKeyAndVisible()
        
        // 创建tabbar
        let tabBarVc = XWMainTabBarController()
        
        window?.rootViewController = tabBarVc
        
        return true
    }
    
}




