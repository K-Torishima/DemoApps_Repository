//
//  CollectionViewCell.swift
//  TestPageViewController
//
//  Created by 鳥嶋 晃次 on 2021/03/08.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let aspectRatio: CGFloat = 4 / 3

        override func awakeFromNib() {
            super.awakeFromNib()
            layer.cornerRadius = 20
        }

}
