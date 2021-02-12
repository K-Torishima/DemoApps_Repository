//
//  ViewController.swift
//  fixTextField
//
//  Created by 鳥嶋 晃次 on 2021/02/12.
//

import UIKit

// クラスの名前をViewContoroller　→　AccountRegisterViewControllerに変える発生する

class AccountRegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var f1: UITextField!
    @IBOutlet weak var f2: UITextField!
    @IBOutlet weak var f3: UITextField!
    @IBOutlet weak var f4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        f1.delegate = self
        f2.delegate = self
        f3.delegate = self
        f4.delegate = self
    }
    
    func initTextField() {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == f1) {
            f2?.becomeFirstResponder()
        } else if (textField == f2) {
            f3?.becomeFirstResponder()
        } else if (textField == f3) {
            f4?.becomeFirstResponder()
        } else if (textField == f4) {
            f1?.becomeFirstResponder()
        }
        return true
    }


}

