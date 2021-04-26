//
//  FirstCollectionViewCell.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/20.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 20
    }

}
