//
//  ParentViewController.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/05.
//

import UIKit

class ParentViewController: UIViewController {
    
    var pageMenu: CAPSPageMenu?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

// 同じVCでVCのタイトルだけ変更したい
extension ParentViewController {
    
    
    
    private func setTitle() {
        let pageTitles: [String] = ["title1","title2", "title3"]
        let first = FirstViewController()
        var controllers: [UIViewController] = []
        
        pageTitles.forEach {
            first.title = $0
            controllers.append(first)
        }
        
        print(controllers)
        
        setup(controllers: controllers)
    }
    
    private func setup(controllers: [UIViewController]) {
        let paramerters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(Constants.Color.Base.Background),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(UIColor.booklogBlue()),
            .bottomMenuHairlineColor(Constants.Color.Base.Background),
            .selectedMenuItemLabelColor(UIColor.booklogBlue()),
            .unselectedMenuItemLabelColor(UIColor.withTrendTabUnselectedColor()),
            .selectionIndicatorHeight(4.0),
            .menuItemFont(UIFont(name: "HiraKakuProN-W6", size: 14.0)!),
            .menuHeight(40.0),
            .menuMargin(16),
            .menuItemWidthBasedOnTitleTextWidth(false), // タイトルのテキストに沿って可変するのをONにするかしないか
            //            .menuItemWidth(140),
            .menuItemSeparatorRoundEdges(true),
            .centerMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllers,
                                frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height),
                                pageMenuOptions: paramerters)
        
        view.addSubview(pageMenu!.view)
        view.sendSubviewToBack(pageMenu!.view)
    }
}

// 複数VCがある状態
extension ParentViewController {
    
//    let firstVC = FirstViewController()
//    let secondVC = SecondViewContoroller()
//    let thirdVC = ThirdViewController()
    
    
//    private func setup() {
//        // - は半角スペースが何個あるか
//        //  上と下は同じに見えるが違う
//        // firstはこれでセンターになる
//        // secondはセンターにならない
//        // secondをセンターにするには、------漢字------ と書かなければならない
//        let space12 = String(repeating: " ", count: 12) // スペースを12とる　表現は左右均等になるので、　６sp title 6sp になる
//        let spaseHyphen = String(repeating: "-", count: 12)
//        let space4 = String(repeating: " ", count: 4)
//        firstVC.title = "漢字" + space12
//        secondVC.title = "漢字" + spaseHyphen
//        thirdVC.title = "ここは任意のタイトルを入れる" + space4
//
//        let controllers: [UIViewController] = [firstVC, secondVC, thirdVC]
//
//        let paramerters: [CAPSPageMenuOption] = [
//            .scrollMenuBackgroundColor(Constants.Color.Base.Background),
//            .viewBackgroundColor(UIColor.white),
//            .selectionIndicatorColor(UIColor.booklogBlue()),
//            .bottomMenuHairlineColor(Constants.Color.Base.Background),
//            .selectedMenuItemLabelColor(UIColor.booklogBlue()),
//            .unselectedMenuItemLabelColor(UIColor.withTrendTabUnselectedColor()),
//            .selectionIndicatorHeight(4.0),
//            .menuItemFont(UIFont(name: "HiraKakuProN-W6", size: 14.0)!),
//            .menuHeight(40.0),
//            .menuMargin(16),
//            .menuItemWidthBasedOnTitleTextWidth(true), // タイトルのテキストに沿って可変するのをONにするかしないか
////            .menuItemWidth(140),
//            .menuItemSeparatorRoundEdges(true),
//            .centerMenuItems(true)
//        ]
//
//        pageMenu = CAPSPageMenu(viewControllers: controllers,
//                                frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height),
//                                pageMenuOptions: paramerters)
//
//        view.addSubview(pageMenu!.view)
//        view.sendSubviewToBack(pageMenu!.view)
//    }
}
