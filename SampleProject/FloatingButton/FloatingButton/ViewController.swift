//
//  ViewController.swift
//  FloatingButton
//
//  Created by 鳥嶋 晃次 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {
    
    var flotingButton = FlotingButton()
    var isBool: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFlotingButton()
    }
    
    func setUpFlotingButton() {
        let image = UIImage(named: "favLOn")
        flotingButton.setImage(image, for: .normal)
        flotingButton.addTarget(self, action: #selector(tappedEditButton), for: .touchUpInside)
    
        let buttonBottomMargin: CGFloat = view.safeAreaInsets.bottom + 100
        let buttonRightMargin: CGFloat = 16
        
        let parentFrame = view.frame
        let position = CGPoint( x: parentFrame.size.width - buttonRightMargin - flotingButton.frame.width,
                                y: parentFrame.size.height - buttonBottomMargin - flotingButton.frame.height
        )
        
        flotingButton.frame.origin = position
        view.addSubview(flotingButton)
        view.bringSubviewToFront(flotingButton)
    }
    
    private func hideEditButton() {
        flotingButton.removeFromSuperview()
    }
    
    @objc func tappedEditButton() {
        
        if !isBool {
            isBool = true
            print(isBool)
        } else {
            isBool = false
            print(isBool)
        }
    }
}


class FlotingButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 0.24
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
