//
//  FirstViewController.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/06.
//

enum CellLayoutPtType {
    static let TopInset:          CGFloat = 8.0
    static let bottomInset:       CGFloat = 10.0
    static let leftInset:         CGFloat = 16.0
    static let rightInset:        CGFloat = 16.0
    static let horizontalSpacing: CGFloat = 12.0
    static let horizontalMargin:  CGFloat = 16.0 * 2.0
    static let half:              CGFloat = 0.5
    static let footerHight:       CGFloat = 16.0
}

import UIKit

final class FirstViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "FirstViewController", bundle: nil)
        self.view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        
        let cellNib = UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "FirstCollectionViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
        return cell
    }
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionHorizontalMargin: CGFloat = CellLayoutPtType.horizontalMargin
        let cellHorizontalSpacing:   CGFloat = CellLayoutPtType.horizontalSpacing
        let width:  CGFloat = (collectionView.frame.size.width - cellHorizontalSpacing - sectionHorizontalMargin) * CellLayoutPtType.half
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:    CellLayoutPtType.TopInset,
                            left:   CellLayoutPtType.leftInset,
                            bottom: CellLayoutPtType.bottomInset,
                            right:  CellLayoutPtType.rightInset)
    }
}


