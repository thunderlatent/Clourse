//
//  AuthService.swift
//  Clourse
//
//  Created by Alvin Tseng on 2020/6/29.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import Foundation
class AuthService {
    
    var sid:Int?
    var accountData = [Account]()
    init() {
        let su = Account(sid: 0, account: "root", password: "0000")
        let user1 = Account(sid: 1, account: "kevin0812@gmail.com", password: "a123456789")
        accountData.append(su)
        accountData.append(user1)
    }
    func verificationSid(account:String) -> Bool {
        for data in accountData{
            if  account == data.account{
                self.sid = data.sid
                return true
            }
        }
        return false
    }
    func passwordVerification(password:String) -> Bool {
        var dataPassword:String = ""
        for data in accountData{
            if self.sid == data.sid{
                dataPassword = data.password
            }
        }
        if password == dataPassword {
            return true
        }else{
            return false
        }
        
    }
    
}
struct Account {
    var sid:Int
    var account:String
    var password:String
    init(sid:Int,account:String,password:String) {
        self.sid = sid
        self.account = account
        self.password = password
    }
}




