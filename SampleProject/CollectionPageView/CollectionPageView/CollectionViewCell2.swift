//
//  CollectionViewCell2.swift
//  CollectionPageView
//
//  Created by 鳥嶋晃次 on 2021/03/15.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .red
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 8, height: 8)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
    }
    
}
