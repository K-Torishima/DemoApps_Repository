//
//  TableViewCell.swift
//  DI_Sample
//
//  Created by 鳥嶋 晃次 on 2021/01/27.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var prefecture: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setCell(list: List) {
        name.text = list.name
        prefecture.text = list.prefecture
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
