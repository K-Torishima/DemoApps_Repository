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
        self.layer.borderWidth = 10
        self.layer.borderColor = UIColor.black.cgColor

        baseView.backgroundColor = .red
    }
    // タップしたらハイライトする　話したら戻る
//    override var isHighlighted: Bool {
//        didSet {
//            if self.isHighlighted {
//                print(isHighlighted)
//                self.baseView.backgroundColor = .orange
//                self.layer.borderColor = UIColor.gray.cgColor
//            } else {
//                print(isHighlighted)
//                self.baseView.backgroundColor = .red
//                self.layer.borderColor = UIColor.black.cgColor
//            }
//        }
//    }
    
    // タップしたら色が変わる、違うCellを選択しない限り、元に戻らない
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                self.baseView.backgroundColor = .orange
//                self.layer.borderColor = UIColor.gray.cgColor
//            } else {
//                self.baseView.backgroundColor = .red
//                self.layer.borderColor = UIColor.black.cgColor
//            }
//        }
//    }
    
//    override var isOpaque: Bool {
//        didSet {
//            if isOpaque {
//                print("true")
//            } else {
//                print("")
//            }
//        }
//    }
    
    
//    override var isFocused: Bool {
//        didSet {
//            if isFocused {
//                print("true")
//            } else {
//                print("false")
//            }
//        }
//    }
}
