//
//  XWOauthVC.swift
//  XWWeibo
//
//  Created by apple on 15/10/28.
//  Copyright © 2015年 ZXW. All rights reserved.
//

import UIKit
import SVProgressHUD // 指示器

class XWOauthVC: UIViewController {

    // 在loadview的时候将view设成webView
    override func loadView() {
        view = webView
        
        webView.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brownColor()
        title = "新浪微博登陆"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        
        
        // 加载网页 
        let request = NSURLRequest(URL: XWNetworkTool.shareInstance.oauthURL())
        webView.loadRequest(request)
        
    }

// MARK: - 退出当前页面
    func close(){
        
        dismissViewControllerAnimated(true, completion: nil)
    }

// MARK: - 懒加载
    private lazy var webView = UIWebView()
}

// MARK: - 扩展 webView代理方法
extension XWOauthVC: UIWebViewDelegate {
    
    // 开始加载
    func webViewDidStartLoad(webView: UIWebView) {
        
        // 状态按钮
        SVProgressHUD.showWithStatus("正在玩命在加载", maskType: SVProgressHUDMaskType.Black)
    }
    
    // 加载完成时状态按钮消失
    func webViewDidFinishLoad(webView: UIWebView) {
        
        SVProgressHUD.dismiss()
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 询问是否加载
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        return true
    }
    
    // 加载失败
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
    }

}






