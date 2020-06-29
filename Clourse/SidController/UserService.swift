//
//  UserService.swift
//  Clourse
//
//  Created by Alvin Tseng on 2020/6/29.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import Foundation

class UserService {
    var userName:String?
    var userNumber:String?
    var userData = [UserData]()
    init() {
        let su = UserData(sid:0 ,userName: "管理員" ,userPhoneNumber: "0922794123")
        let user1 = UserData(sid: 1, userName: "Kevin", userPhoneNumber: "0922794123")
        userData.append(su)
        userData.append(user1)
    }
    func getUserData(_ sid:Int){
        for data in userData{
            if sid == data.sid{
                self.userName = data.userName
                self.userNumber = data.userPhoneNumber
            }
        }
    }
}
struct  UserData {
    var sid:Int?
    var userName:String?
    var userPhoneNumber:String?
}


