//
//  ContainerViewController.swift
//  degate
//
//  Created by 鳥嶋 晃次 on 2021/02/01.
//

import UIKit



class ContainerViewController: UIViewController {
    
    let vc: ViewController = ViewController()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    
    }
}

extension ContainerViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
       
        return cell
    }
}

extension ContainerViewController: Action {
    func changeColor() {
        view.backgroundColor = .black
        loadViewIfNeeded()
    }
    
    
}

