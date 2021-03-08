//
//  TransitionProtocol.swift
//  VIPER_Sample
//
//  Created by 鳥嶋晃次 on 2021/01/04.
//

import Foundation
import UIKit

// RouterはViewControllerの代わりに画面遷移を行う
// UIViewControllerが持っているpushViewControllerや、popViewControllerを実現するにはどのようにしたら良いか

// UIViewControllerにだけ継承させるProtocolを定義し、ExtentionでPush等のメソッドを定義する
// 以下のプロトコルを継承させれば、RouterからView Purotocolを経由してもpushViewContoroller等をコールすることができる


protocol TransitionProtocol: class {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    func popToRootViewController(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void))
}


extension TransitionProtocol where Self: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = self.navigationController else { return }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool) {
        guard let navigationController = self.navigationController else { return }
        navigationController.popViewController(animated: animated)
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = self.navigationController else { return }
        navigationController.popToViewController(viewController, animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        guard let navigationController = self.navigationController else { return }
        navigationController.popToRootViewController(animated: animated)
    }
    
    func present(_ viewController: UIViewController, animated: Bool) {
        self.present(viewController, animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)) {
        self.dismiss(animated: animated, completion: completion)
    }
}
