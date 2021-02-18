//
//  ViewController.swift
//  MyWorkSample
//
//  Created by 鳥嶋 晃次 on 2021/02/18.
//

import UIKit

/*
 登場人物
 ボタンA
 ボタンB
 
 やりたいこと
 
 ボタンA
 - ボタンAを押すとボタンAのカウントが一つ増える　色が変わる
 - もう一度押すとボタンAのカウントは戻る　色も戻る
 - ボタンAを押すとボタンBの状態も押された状態になる
 
 ボタンB
 - ボタンBを押すとボタンの色が変わる
 - もう一度押すとボタンの色が戻る
 - ボタンAのカウントが増える
 
 両者は連動しており
 どっちかを押したらボタンの状態は変わる
 ボタンAのみにカウントが存在し、ボタンBにはカウントは存在しない

 
 */

final class ViewController: UIViewController {
    
    @IBOutlet private weak var buttonA: UIButton!
    @IBOutlet private weak var buttonB: UIButton!
    
    private var isButtonFlag: Bool = false
    
    private var countText = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonA.backgroundColor = .orange
        buttonA.setTitle("こちらはカウントします: \(countText)", for: .normal)
        buttonA.layer.cornerRadius = 10
        buttonA.setTitleColor(.black, for: .normal)
        
        buttonB.backgroundColor = .cyan
        buttonB.setTitle("こちらはカウントしません", for: .normal)
        buttonB.layer.cornerRadius = 10
        buttonB.setTitleColor(.black, for: .normal)

    }
    
    
    @IBAction func actionA(_ sender: Any) {
        buttonA.backgroundColor = .gray
        buttonA.setTitle("こちらはカウントします: \(countText)", for: .normal)
    }
    
    
    @IBAction func actionB(_ sender: Any) {
        buttonB.backgroundColor = .gray
    }
    
    private func isTapButtonFlag() {
        if isButtonFlag {
            
        }
    }
    
    private func isTaped() {
        isButtonFlag = true
        countText = countText + 1
    }
    
    private func isUnTaped() {
        isButtonFlag = false
        countText = countText - 1
    }
    
    private func switchingButtonColor(isButtonFlag: Bool) {
        self.isButtonFlag = isButtonFlag
    }
}

