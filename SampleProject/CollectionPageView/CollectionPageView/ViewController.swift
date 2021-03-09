//
//  ViewController.swift
//  CollectionPageView
//
//  Created by 鳥嶋晃次 on 2021/03/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCellLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    
    private func updateCellLayout() {
        collectionView.decelerationRate = .fast
        let flowLayout = FlowLayout()
        flowLayout.scrollDirection = .horizontal
        let width = UIScreen.main.bounds.width - 24 * 2
        let height = collectionView.bounds.height - 40 * 2
        
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.sectionInset = UIEdgeInsets(top: .zero, left: 24, bottom: .zero, right: 24)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let collectionView = scrollView as! UICollectionView
        (collectionView.collectionViewLayout as! FlowLayout).prepareForPaging()
    }
}
