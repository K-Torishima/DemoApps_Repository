//
//  ViewController.swift
//  DI_Sample
//
//  Created by 鳥嶋 晃次 on 2021/01/27.
//

import UIKit
import Instantiate

struct List {
    var name: String
    var prefecture: String
    
    init(name: String, prefecture: String) {
        self.name = name
        self.prefecture = prefecture
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [List] = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        setUpList()
    }
    
    func setUpList() {
        list = [
            List(name: "飯田橋", prefecture: "東京都新宿区"),
            List(name: "九段下", prefecture: "東京都千代田区"),
            List(name: "お茶の水", prefecture: "東京都文京区")
        ]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setCell(list: list[indexPath.row])
        return cell
    }
}

