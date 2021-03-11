//
//  CustomView.swift
//  test
//
//  Created by 鳥嶋 晃次 on 2021/03/11.
//

protocol TestDelegate: class  {
    func test()
}

import UIKit

class CustomView: UIView {
    
    weak var delegate: TestDelegate?
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           loadNib()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           loadNib()
       }
       
       private func loadNib() {
           if let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self)?.first as? UIView {
               view.frame = self.bounds
               self.addSubview(view)
           }
       }
    
    @IBAction func tap(_ sender: Any) {
        delegate?.test()
    }
}
