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
    
    
    // MARK: - 1.创建单例 继续自本类
    static let shareInstance: XWNetworkTool = {
        
        let urlStr = "https://api.weibo.com/"
        
        let tool = XWNetworkTool(baseURL: NSURL(string: urlStr))
        
        
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    
    // MARK: - 2 Oauth授权url  注意参数不要复制出错
    // 2.参数
    // 申请时应用时分配的APPKey
    private let client_id = "1369851949"
    
    // 回调地址
    let  redirect_uri = "http://www.baidu.com/"
    
    /// 请求的类型，填写authorization_code
    private let grant_type = "authorization_code"
    
    // 应用的secert
    private let client_secret = "abc9cd7b14e70a7b26ad4e1cfa147e0e"
    
    //  MARK: - 3.OAthURL地址 Oauth授权url
    func oauthURL() -> NSURL {
        
        // 拼接
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"
        
       
        return NSURL(string: urlString)!
    }
    
    // MARK: - 4.加载AssesToken
    func loadAssesToken(code: String , finished: (result: [String: AnyObject]? ,error: NSError?) -> ()){
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        // 参数
        let parameters = [
            //"code" : code
            "client_id" : client_id ,
            "client_secret": client_secret,
            "grant_type": grant_type,
            "code": code,
            "redirect_uri": redirect_uri
        ]
        // 错误的
//        let parameters = {
//            "client_id": client_id,
//            "client_secret": client_secret,
//            "grant_type": grant_type,
//            "code": code,
//            "redirect_uri": redirect_uri
//       }
        
        // 网络请求
        POST(urlString, parameters: parameters, success: { (_, result) -> Void in
            
            // 成功时告诉调用闭包者得到result
            finished(result: result as? [String: AnyObject] , error: nil)
            
            }) { (_, error) -> Void in
            
            // 失败时告诉调用闭包者得到error
            finished(result: nil, error: error)
        }
        
    }
    
}



