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
    private var pickerCell1: PickerCell?
    private var pickerCell2: PickerCell?
    
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath)
            pickerCell1 = cell as? PickerCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath) as! NormalCell
            cell.titleLabel.text = "\(indexPath.section)-\(indexPath.row)"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath)
            pickerCell2 = cell as? PickerCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            tableView.performBatchUpdates {
                if self.showingDatePicker {
                    pickerCell1?.hidePicker()
                } else {
                    pickerCell1?.showPicker()
                }
            } completion: { _ in
                self.showingDatePicker.toggle()
            }
        case 1:
            break
        case 2:
            tableView.performBatchUpdates {
                if self.showingDatePicker {
                    pickerCell2?.hidePicker()
                } else {
                    pickerCell2?.showPicker()
                }
            } completion: { _ in
                self.showingDatePicker.toggle()
            }
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section\(section)"
    }
    
}
