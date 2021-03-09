//
//  CollectionViewCell.swift
//  CollectionPageView
//
//  Created by 鳥嶋晃次 on 2021/03/08.
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

        baseView.backgroundColor = UIColor(red: 188/255, green: 123/255, blue: 167/255, alpha: 1)
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                print(isHighlighted)
                let shrink = CABasicAnimation(keyPath: "transform.scale")
                //アニメーションの間隔
                shrink.duration = 0.1
                //1.0から0.95に小さくする
                shrink.fromValue = 1.0
                shrink.toValue = 0.95
                //自動で元に戻るか
                shrink.autoreverses = true
                //繰り返す回数を1回にする
                shrink.repeatCount = 1
                //アニメーションが終了した状態を維持する
                shrink.isRemovedOnCompletion = false
                shrink.fillMode = CAMediaTimingFillMode.forwards
                //アニメーションの追加
                self.layer.add(shrink, forKey: "shrink")
                
//            } else {
//                print(isHighlighted)
////                isHighlighted = true
//                //指が離れた時の処理を書く
//                let shrink = CABasicAnimation(keyPath: "transform.scale")
//                //アニメーションの間隔
//                shrink.duration = 0.2
//                //1.0から0.95に小さくする
//                shrink.fromValue = 1.0
//                shrink.toValue = 0.95
//                //自動で元に戻るか
//                shrink.autoreverses = false
//                //繰り返す回数を1回にする
//                shrink.repeatCount = 1
//                //アニメーションが終了した状態を維持する
//                shrink.isRemovedOnCompletion = false
//                shrink.fillMode = CAMediaTimingFillMode.forwards
//                //アニメーションの追加
//                self.layer.add(shrink, forKey: "shrink")
            }
        }
    }
}
