//
//  ViewController.swift
//  fixTextField
//
//  Created by 鳥嶋 晃次 on 2021/02/12.
//

import UIKit

// テスト検証用のCode
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
        setupTextField()
    }
    
    func setupTextField() {
        textField1.keyboardType = .asciiCapable
        textField2.keyboardType = .asciiCapable
        textField2.textContentType = .password
        textField2.isSecureTextEntry = true
        textField3.keyboardType = .asciiCapable
        textField4.keyboardType = .asciiCapable
    }
    
    // Nextを押すと自動で次のキーボードに切り替え
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

