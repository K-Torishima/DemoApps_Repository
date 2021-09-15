//
//  Ex.swift
//  Implement_SVProgressHUD
//
//  Created by 鳥嶋 晃次 on 2021/09/14.
//

import Foundation
import SVProgressHUD

public extension SVProgressHUD {

    public struct iq {  // プロジェクトに合わせた名前で良い

        // プロジェクト固有の初期設定
        public static func setup() {
            SVProgressHUD.setDefaultStyle(.custom)
            SVProgressHUD.setFont(UIFont.boldSystemFont(ofSize: 14.0))
            SVProgressHUD.setForegroundColor(UIColor.red)
            SVProgressHUD.setBackgroundColor(UIColor.white.withAlphaComponent(0.9))
            SVProgressHUD.setMinimumDismissTimeInterval(2.0)
        }

        public static func show(maskType: SVProgressHUDMaskType = .none) {
            SVProgressHUD.setDefaultMaskType(maskType)
            SVProgressHUD.show()
        }
    }
}
