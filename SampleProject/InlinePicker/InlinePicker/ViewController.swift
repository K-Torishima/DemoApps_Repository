//
//  ViewController.swift
//  InlinePicker
//
//  Created by 鳥嶋 晃次 on 2021/09/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var showingDatePicker = false
    private var pickerCell: PickerCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib1 = UINib(nibName: "NormalCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "NormalCell")
        let nib2 = UINib(nibName: "PickerCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "PickerCell")
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 1) ? 1 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath)
            pickerCell = cell as? PickerCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath) as! NormalCell
        cell.titleLabel.text = "\(indexPath.section)-\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.section == 1 else {
            return
        }
        
        tableView.performBatchUpdates {
            if self.showingDatePicker {
                pickerCell?.hidePicker()
            } else {
                pickerCell?.showPicker()
            }
        } completion: { _ in
            self.showingDatePicker.toggle()
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section\(section)"
    }
    
}
