//
//  NormalCell.swift
//  InlinePicker
//
//  Created by 鳥嶋 晃次 on 2021/09/02.
//

import UIKit

class NormalCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
