//
//  ViewController.swift
//  Implement_SVProgressHUD
//
//  Created by 鳥嶋 晃次 on 2021/09/14.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()
        SVProgressHUD.setViewForExtension(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            SVProgressHUD.dismiss()
        }
    }
    
    


}

