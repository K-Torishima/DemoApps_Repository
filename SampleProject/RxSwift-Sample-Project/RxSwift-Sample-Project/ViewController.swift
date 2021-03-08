//
//  ViewController.swift
//  RxSwift-Sample-Project
//
//  Created by 鳥嶋晃次 on 2021/01/03.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var favCountLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    private var favCount = 0
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rx.tapはUIButtonに用意されている、ボタンがタップされたことを通知してくれるObservable
        // 「subscribe」は購読という意味、対象に変化があった時に呼ばれる。今回はfavButtonがタップされる時。
        // 「onNext」はイベントが通知通りであるたびに通知をする、他にもerror時に通知するonError、完了時に通知するonCompletedがある
        // 「disposed」は購読の解除　onNextの場合はイベント後も購読が継続するため、メモリーリークになる恐れがある、なのでdisposedで解放してあげる必要がある
        
        favButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.favCount += 1
                self.favCountLabel.text = String(self.favCount)
            })
            .disposed(by: disposeBag)
    }
}

