//
//  FirstViewController.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/06.
//

import UIKit

final class FirstViewController: UIViewController {
    
    
    lazy var testlabel: UILabel = {
       var label = UILabel()
        return label
    }()
    
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testlabel.text = "\(num)"
        
        view.backgroundColor = .brown
    }
}
