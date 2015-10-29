//
//  XWAFNTool.swift
//  XWWeibo
//
//  Created by apple on 15/10/28.
//  Copyright © 2015年 ZXW. All rights reserved.
//


// MARK : - ios9中的网络请求需配key

import Foundation
import AFNetworking

class XWNetworkTool: AFHTTPSessionManager {
    
    // 1.创建单例 继续自本类
    static let shareInstance: XWNetworkTool = {
        
        let urlStr = "https://api.weibo.com/"
        
        let tool = XWNetworkTool(baseURL: NSURL(string: urlStr))
        
        
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    
    // MARK: - Oauth授权url
    // 2.参数
    // 申请时应用时分配的APPKey
    private let client_id = "3769988269"
    
    // 回调地址
    private let  redirect_uri = "http://www.baidu.com/"
    
    /// 请求的类型，填写authorization_code
    private let grant_type = "authorization_code"
    
    // 应用的secert
    private let client_secret = "8c30d1e7d3754eca9076689b91531c6a"
    
    // 3.OAthURL地址 Oauth授权url
    func oauthURL() -> NSURL {
        
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"
        
       
        return NSURL(string: urlString)!
    }
    
    // MARK: - 获得AssesToken
    
    
    
}