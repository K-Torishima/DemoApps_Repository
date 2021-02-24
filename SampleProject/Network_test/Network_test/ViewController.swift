//
//  ViewController.swift
//  Network_test
//
//  Created by 鳥嶋 晃次 on 2021/02/24.
//

import UIKit
import Network

class ViewController: UIViewController {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "")
    @IBOutlet weak var labl: UILabel!
    @IBOutlet weak var sampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let wifiMonitor = NWPathMonitor(requiredInterfaceType: .wifi)
        print(wifiMonitor)
        monitoring()
    }
    
    // UIの更新をしたい場合はメインスレッドで行う
    // ネットワークが通じていたら　sampleViewは表示される
    // ネットワークが切れていたら　sampleViewは表示されない
    private func monitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.labl.text = "Connected"
                    self.sampleView.isHidden = false
                    print("Connected")
                } else {
                    self.labl.text = "Not Connected"
                    self.sampleView.isHidden = true
                    print("Not Connected")
                }
            }
        }
        monitor.start(queue: queue)
    }
}

