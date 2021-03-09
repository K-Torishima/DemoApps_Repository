//
//  CollectionViewCell.swift
//  CollectionPageView
//
//  Created by 鳥嶋晃次 on 2021/03/08.
// https://qiita.com/edasan/items/8c7446fafd0d3a56d31c
// 

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        baseView.layer.cornerRadius = 20
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 8, height: 8)

        baseView.backgroundColor = .red
        
        
        
    }
    
    override var isHighlighted: Bool {
            didSet {
                if self.isHighlighted {
                    print(isHighlighted)
                    self.baseView.backgroundColor = .orange
                } else {
                    print(isHighlighted)
                    self.baseView.backgroundColor = .red
                }
        }
    }
    
}
