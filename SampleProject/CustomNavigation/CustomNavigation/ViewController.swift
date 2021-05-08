//
//  ViewController.swift
//  CustomNavigation
//
//  Created by 鳥嶋晃次 on 2021/05/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "タイトル"
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        
        let item1 = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(taped))
        let item2 = UIBarButtonItem(image: .checkmark, style: .plain, target: self, action: #selector(taped))
        let item3 = UIBarButtonItem(image: .actions, style: .plain, target: self, action: #selector(taped))
        let item4 = UIBarButtonItem(image: .remove, style: .plain, target: self, action: #selector(taped))

         // stackViewが存在するため勝手にオートレイアウトが効いてしまう
         // NavigationItemを視覚的に詰めたい場合Imageにインセットを入れてあげれば良いがこれはあまり良くない
         // 本来であればデフォルトの位置で実装するべきなんだと思う
//        item2.imageInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
//        item1.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
        
       
    

        navigationItem.setRightBarButtonItems([item1, item2, item3, item4], animated: true)
    }
    
    @objc private func taped() {
        print("taped")
    }
}

