//
//  ContainerViewController2.swift
//  degate
//
//  Created by 鳥嶋 晃次 on 2021/02/01.
//

import UIKit

class ContainerViewController2: UIViewController {
    
    var vc: ViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension ContainerViewController2: Action {
    func changeColor() {
        self.view.backgroundColor = .black
        
    }
}
