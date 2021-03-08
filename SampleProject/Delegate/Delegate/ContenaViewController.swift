//
//  ContenaViewController.swift
//  Delegate
//
//  Created by 鳥嶋晃次 on 2021/01/26.
//

import UIKit

class ContenaViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = text
        
    }
}
