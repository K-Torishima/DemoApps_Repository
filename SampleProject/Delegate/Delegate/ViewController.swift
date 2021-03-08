//
//  ViewController.swift
//  Delegate
//
//  Created by 鳥嶋晃次 on 2021/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self

    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        
        let vc = ContenaViewController()
        if let text = searchbar.text {
            print(text)
            vc.text = text
            
            self.testLabel.text = text
        }
        self.view.layoutIfNeeded()
    }
}
