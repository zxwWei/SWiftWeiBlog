//
//  XWCompassView.swift
//  XWWeibo
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 ZXW. All rights reserved.
//

import UIKit

class XWCompassView: UIView {

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.prepareUi()
    }

// MARK: - 准备UI
    func prepareUi() {
    
        // 往view添加子控件
        addSubview(rotationIconView)
        addSubview(homeView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        
        // 设置约束
        rotationIconView.translatesAutoresizingMaskIntoConstraints = false
        homeView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        // 添加约束
        // 转轮 centerX
        self.addConstraint(NSLayoutConstraint(item: rotationIconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: rotationIconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -40))
        
        // 小房子
        self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: rotationIconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: rotationIconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        
        // 信息
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: homeView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: homeView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 44))
        // 信息的宽度
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 240))
        
        
        
        // 登陆按钮
        // 左边
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        // 顶部
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        
        // 宽度
         self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        
        // 高度
         self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 36))
        
        
        
        // 注册按钮
        // 右边
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
        // 顶部
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        
        // 宽度
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        
        // 高度
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 36))
        
    
    }

// MARK: - 懒加载

    /// 旋转的图像
    lazy var rotationIconView: UIImageView = {
        
        let iconView = UIImageView()
        iconView.image = UIImage(named: "visitordiscover_feed_image_smallicon")
       
        // 自动适配图像
        iconView.sizeToFit()

        return iconView
    }()
    
    /// 小房子
    lazy var homeView: UIImageView = {
       let homeView = UIImageView()
        
        homeView.image = UIImage(named: "visitordiscover_feed_image_house")
        
        homeView.sizeToFit()
        
        return homeView
    }()
    
    /// 信息
    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        
        messageLabel.text = "想看更多的好东西吗想看更多的好东西吗想看更多的好东西吗想看更多的好东西吗想看更多的好东西吗想看更多的好东西吗"
        messageLabel.textColor = UIColor.blackColor()
        
        // 设置分行
        messageLabel.numberOfLines = 0
        messageLabel.sizeToFit()
        
        return messageLabel
        }()
    
    
    
    /// 注册按钮
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        
        registerButton.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        registerButton.setTitle("登陆", forState: UIControlState.Normal)
        registerButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        registerButton.sizeToFit()
        
        return registerButton
        }()
    
    /// 登陆按钮
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        
        // setBackgroundImage 才会切割
        loginButton.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        loginButton.setTitle("注册", forState: UIControlState.Normal)
        loginButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)

        loginButton.sizeToFit()
        
        return loginButton
    }()
    
    
    

}
