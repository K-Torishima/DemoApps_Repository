//
//  CollectionViewPageViewController.swift
//  TestPageViewController
//
//  Created by 鳥嶋 晃次 on 2021/03/08.
//

//import UIKit
//
//final class CollectionViewPageViewController: UICollectionViewController {
//    private var cellSize: CGSize {
//        let width = collectionView.bounds.width * 0.8
//        let height = width * CollectionViewCell.aspectRatio
//        return CGSize(width: width, height: height)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView.decelerationRate = .fast
//
//        let flowLayout = collectionViewLayout as! FlowLayout
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = cellSize
//        flowLayout.minimumInteritemSpacing = collectionView.bounds.height
//        flowLayout.minimumLineSpacing = 20
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
//    }
//
//    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
//        return 5
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        return cell
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind _: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
//    }
//}
//
//extension CollectionViewPageViewController: UICollectionViewDelegateFlowLayout {
//    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        let collectionView = scrollView as! UICollectionView
//        (collectionView.collectionViewLayout as! FlowLayout).prepareForPaging()
//    }
//}
