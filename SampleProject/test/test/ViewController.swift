//
//  ViewController.swift
//  test
//
//  Created by 鳥嶋 晃次 on 2021/03/11.
//

import UIKit

class ViewController: UIViewController, TestDelegate {
    
    
    @IBOutlet weak var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
    
    func test() {
        print("テストです")
        view.backgroundColor = .brown
    }
    
    @IBAction func tap(_ sender: Any) {
        customView.testVC()
        
    }
}

