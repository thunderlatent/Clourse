//
//  InputNameViewController.swift
//  Clourse
//
//  Created by Alvin Tseng on 2020/6/25.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class InputNameViewController: UIViewController{
    var delegate:LoginDelegate?
    var sid : Int?
    var id:String?
    var password:String?
    var authService = AuthService()
    var userService = UserService()
    override func viewDidLoad() {
        showError.alpha = 0
        super.viewDidLoad()
    }
    @IBOutlet weak var showError: UILabel!
    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBAction func login(_ sender: Any) {
     
        //驗證填入的帳號與密碼格式
        id = ID.text
        password = passwordLabel.text
        //驗證是否有該ID
        let idIsTrue = self.authService.verificationSid(account: id!)
        if(idIsTrue){
            self.sid = authService.sid
             showErrorView(state: false)
            //驗證密碼
            let psIsTrue =
                self.authService.passwordVerification(password: password!)
            if(psIsTrue){
                //取得帳戶資料
                 showErrorView(state: false)
                print("密碼正確")
                userService.getUserData(self.sid!)
                let userName = userService.userName
                let userPhoneNumber = userService.userNumber
                self.delegate?.showUserData(userName!, userPhoneNumber!)
                self.dismiss(animated: true, completion: nil)
            }else{
                showErrorView(state: true)
            }
        }else{
            showErrorView(state: true)
        }
    }
    func showErrorView(state:Bool){
        if(state){
            UIView.animate(withDuration: 1){
                self.showError.alpha = 1
            }
        }else{
            UIView.animate(withDuration: 1){
                self.showError.alpha = 0
            }
        }

    }
}


