//
//  Login.swift
//  ProjUI
//
//  Created by 李威 on 2021/7/14.
//

import Foundation

//func login(_ info: [String : String]) {
//    let username:String
//    if let tmp = info["username"] {
//        username = tmp
//    } else {
//        print("请输入用户名")
//        return
//    }
//
//    let password:String
//    if let tmp = info["password"] {
//        password = tmp
//    } else {
//        print("请输入密码")
//        return
//    }
//
//    print("用户名：\(username),密码：\(username)")
//
//}

func login(_ info: [String : String]) {
    guard let username = info["username"] else {
        print("请输入用户名")
        return
    }
    
    guard let password = info["password"] else {
        print("请输入密码")
        return
    }
    
    print("用户名：\(username),密码：\(password)")
    
}
