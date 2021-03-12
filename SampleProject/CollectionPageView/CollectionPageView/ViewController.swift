//
//  ViewController.swift
//  CollectionPageView
//
//  Created by 鳥嶋晃次 on 2021/03/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var contentCells: [UICollectionViewCell] = []
    
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
        flowLayout.sectionInset = UIEdgeInsets(top: .zero, left: 24, bottom: .zero, right: 24)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 24 * 2
        let height = collectionView.frame.size.height - 40 * 2
        return CGSize(width: width, height: height)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        contentCells.append(cell)
        if indexPath.row == .zero {
            cell.backgroundColor = .black
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let collectionView = scrollView as! UICollectionView
        (collectionView.collectionViewLayout as! FlowLayout).prepareForPaging()
        print("スクロール開始")
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 現在の完全に表示されているCellを取得
        let visibleCells = collectionView.visibleCells.filter { return collectionView.bounds.contains($0.frame) }
        // CollectionViewCellと完全に表示されているCellを比較し、完全に表示されているCellのみborderColorをBooklogBlueにする
        contentCells.forEach { cell in
            visibleCells.forEach { visibleCell in
                if cell != visibleCell {
                    cellColor(cell: cell)
                } else {
                    cellUnColor(cell: visibleCell)
                }
            }
        }
        
    }
    
    
    func cellColor(cell: UICollectionViewCell) {
        cell.backgroundColor = .white
    }
    
    func cellUnColor(cell: UICollectionViewCell) {
        cell.backgroundColor = .black
    }
    
}
