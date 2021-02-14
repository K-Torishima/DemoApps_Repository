//
//  ViewController.swift
//  fixTextField
//
//  Created by 鳥嶋 晃次 on 2021/02/12.
//

import UIKit

// クラスの名前をViewContoroller　→　AccountRegisterViewControllerに変える発生する

class AccountRegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
    }
    
    func initTextField() {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == textField1) {
            textField2?.becomeFirstResponder()
        } else if (textField == textField2) {
            textField3?.becomeFirstResponder()
        } else if (textField == textField3) {
            textField4?.becomeFirstResponder()
        } else if (textField == textField4) {
            textField1?.becomeFirstResponder()
        }
        return true
    }


}

