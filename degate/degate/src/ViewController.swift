//
//  ViewController.swift
//  degate
//
//  Created by 鳥嶋 晃次 on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var subView: UIView!
    
    var delegate: Action?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }

    @IBAction func tapBtn(_ sender: Any) {
        print("Tap")
        delegate?.changeColor()
       
    }
    
}

extension ViewController: Action {
    func changeColor() {
        subView.backgroundColor = .red
    }
    
    
}

