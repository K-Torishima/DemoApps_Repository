//
//  MainViewController.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/20.
//

import UIKit

class MainViewController: UIViewController {
    
    enum IndexType: Int {
        case index0 = 0
        case index1 = 1
        case index2 = 2
        case index3 = 3
    }
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "main"
    }
    
    @IBAction func index0(_ sender: Any) {
        presenter(index: .index0)
    }
    
    @IBAction func index1(_ sender: Any) {
        presenter(index: .index1)
    }
    
    @IBAction func index3(_ sender: Any) {
        presenter(index: .index3)
    }
    
    func presenter(index: IndexType) {
        let vc = ParentViewController()
        vc.setItem(pageIndex: index.rawValue)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
