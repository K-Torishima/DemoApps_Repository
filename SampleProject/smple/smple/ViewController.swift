//
//  ViewController.swift
//  smple
//
//  Created by koji torishima on 2020/10/16.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var text: UILabel!
    var textval: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        text.backgroundColor = .cyan
        textField.keyboardType = .numberPad
        textField.delegate = self
    // let trimmedString = textval.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textval =
        return true
    }

    @IBAction func toview(_ sender: UITapGestureRecognizer) {
        text.text = textField.text
        textField.resignFirstResponder()
    }

}

