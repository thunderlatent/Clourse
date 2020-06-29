//
//  ViewController.swift
//  Clourse
//
//  Created by Alvin Tseng on 2020/6/25.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var showUserID: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? InputNameViewController {
            secondVC.delegate = self
        }
    }
    
}
extension ViewController:LoginDelegate{
    func showUserData(_ userName: String, _ userPhoneNumber: String) {
        showUserID.textColor = .blue
        showUserID.text = "歡迎\(userName)"
    }
}


