//
//  XWOauthVC.swift
//  XWWeibo
//
//  Created by apple on 15/10/28.
//  Copyright © 2015年 ZXW. All rights reserved.
//

import UIKit

class XWOauthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "新浪微博登陆"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        
    
    }

// MARK: - 退出当前页面
    func close(){
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    


}
